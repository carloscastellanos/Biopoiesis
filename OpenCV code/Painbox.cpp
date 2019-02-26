/*
 *  Created by Steven Barnes on 12-06-05
 *  Copyright 2012 __DPrime Research__. All rights reserved.
 *
 */

#include "Painbox.h"
#include <stdio.h>
#include <stdlib.h>
#include <stream.h>
#include <cassert>
#include <iostream>

#define ADDRESS "localhost"
#define PORT 7000
#define FRAMES_BETWEEN_UDP_SENDS 1
#define OUTPUT_BUFFER_SIZE 1024
#define ELECTRODE_CIRCLE_RADIUS 30
#define NUM_FRAMES_BETWEEN_SNAPS 60

using namespace std;
using namespace cv;

//set these values at start
bool doSnapShots = true;
const char* IMAGE_FILE_NAME = "images/Sigraph_tests";

const char* CAM_WINDOW_NAME = "Raw Image From Overhead Cam";
const char* SMOOTHED_WINDOW_NAME = "Smoothed (Bilateral Filter) Cam Image";
const char* LAB_COLOR_WINDOW_NAME = "Change to LAB Color Space";
const char* LOW_THRESHOLD_WINDOW_NAME = "Low Threshold Mask";
const char* HIGH_THRESHOLD_WINDOW_NAME = "High Threshold Mask";
const char* FOREGROUND_RESULT_NAME = "Motion Detection Cam";
const char* SNAP_WINDOW_NAME = "Biopoiesis Cam";
const float WINDOW_SCALE = 3;
const float WINDOW_SCALE2 = 1;

int frameNum = 0;

int snapCounter = 0;

//variables for calculating framerate
int numFrames = 0;
float overtime = 0;
float nextUpdate = 0;
float fps = 0;
CvFont font;

//variables for writing image files
int p[3];
int frameCount = 1;

CvPoint electrodes[NUM_ELECTRODES];
int elecIncrement = 0;
bool hasAllElectrodes = false;

CvScalar bgData[NUM_ELECTRODES];

//variables for socket connection
UdpTransmitSocket transmitSocket(IpEndpointName(ADDRESS, PORT));
char buffer[OUTPUT_BUFFER_SIZE];
osc::OutboundPacketStream oscStream(buffer, OUTPUT_BUFFER_SIZE);

Painbox::Painbox(void)
{   
	cout << "starting up";
	
	// current date/time based on current system
	time_t now = time(0);
	tm *ltm = localtime(&now);
	
	cout << "Current time: " << ltm->tm_mon + 1 << "_" << ltm->tm_mday << "_" << ltm->tm_hour << "_" << ltm->tm_min << endl;
	
    // create all necessary instances
    cvNamedWindow(CAM_WINDOW_NAME, CV_WINDOW_AUTOSIZE);

	cvNamedWindow(FOREGROUND_RESULT_NAME, CV_WINDOW_AUTOSIZE);
	if(doSnapShots == true)
	{
		cvNamedWindow(SNAP_WINDOW_NAME, CV_WINDOW_AUTOSIZE);
	}
	
	cvSetMouseCallback(FOREGROUND_RESULT_NAME, mouseHandler, NULL);
	
	if(doSnapShots == true)
	{
		snapCamera = cvCreateCameraCapture(0);
		snapStorage = cvCreateMemStorage(0);
	}
	camera = cvCreateCameraCapture(1);//CV_CAP_ANY put 1 for USB webcam
	cout << "finished creating cameras";
    storage = cvCreateMemStorage(0);
	cout << "finished creating storage";
    assert(storage);
	if(doSnapShots == true)
	{
		assert(snapStorage);
	}
	
    if (!camera || !snapCamera)
	{
		abort();
		cout << "Aborting: One or more cameras missing";
	}
	else 
	{
		//set properties for capture
		cvSetCaptureProperty(camera, CV_CAP_PROP_FPS, 76);
		
		if (doSnapShots == true)
		{
			cvSetCaptureProperty(snapCamera, CV_CAP_PROP_FPS, 76);
			cvSetCaptureProperty(snapCamera, CV_CAP_PROP_EXPOSURE, .01);
			snap_image = cvQueryFrame (snapCamera);
			cvShowImage(SNAP_WINDOW_NAME, snap_image);
			cout << "got snap_image";
			
			p[0] = CV_IMWRITE_JPEG_QUALITY;
			p[1] = 100;
			p[2] = 0;
		}

		//Start drawing to windows
		draw();
	}

	cvReleaseMemStorage(&storage);

	if(doSnapShots == true)
	{
		cvReleaseMemStorage(&snapStorage);
	}


	cvReleaseCapture(&camera);

	if(doSnapShots == true)
	{
		cvReleaseCapture(&snapCamera);
	}

	
	exit(0);
}

void Painbox::mouseHandler(int event, int x, int y, int flags, void *param)
{
if(hasAllElectrodes == false)
{
    switch(event) {
			/* left button down */
        case CV_EVENT_LBUTTONDOWN:
			//add an electrode location
			cout << "click!";
			
			if(elecIncrement < (NUM_ELECTRODES - 1))
			{
				electrodes[elecIncrement] = cvPoint(x, y);
				elecIncrement++;
			}
			else {
				electrodes[elecIncrement] = cvPoint(x, y);
				hasAllElectrodes = true;
			}
			cout << "numElectrodes=" << elecIncrement;

            break;
			
			/* right button down */
        case CV_EVENT_RBUTTONDOWN:
            break;
			
			/* mouse move */
        case CV_EVENT_MOUSEMOVE:
            break;
    }
}
}

void Painbox::draw(){
	// get an initial frame and duplicate it for later work
	current_frame = cvQueryFrame (camera);
	cam_image = cvCreateImage(cvSize(current_frame->width/WINDOW_SCALE, current_frame->height/WINDOW_SCALE), IPL_DEPTH_8U, 3);
	smoothed_image = cvCreateImage(cvSize(current_frame->width/WINDOW_SCALE, current_frame->height/WINDOW_SCALE), IPL_DEPTH_8U, 3);
	lab_image = cvCreateImage(cvSize(current_frame->width/WINDOW_SCALE, current_frame->height/WINDOW_SCALE), IPL_DEPTH_8U, 3);
	result_image = cvCreateImage(cvSize(current_frame->width*WINDOW_SCALE2, current_frame->height*WINDOW_SCALE2), IPL_DEPTH_8U, 3);
	udp_image = cvCreateImage(cvSize(current_frame->width*WINDOW_SCALE2, current_frame->height*WINDOW_SCALE2), IPL_DEPTH_8U, 1);
	assert(current_frame && cam_image);
	
	initiateGMM();
	
    while(current_frame = cvQueryFrame(camera))
    {
		//show the cam image
		cvResize (current_frame, cam_image, CV_INTER_LINEAR);
        cvShowImage(CAM_WINDOW_NAME, cam_image);
		
		//SMOOTHING: perform the smoothing and show the result
		cvSmooth(cam_image, smoothed_image, CV_BILATERAL, 3, 3, 125, 1);
		
		cvCvtColor(smoothed_image, lab_image, CV_BGR2Lab);
		
		rgbimage = lab_image;  //use the lab color space for all operations
		
		if(frameNum == 0)
		{	
			bgs.InitModel(rgbimage);
		}
		
		bgs.Subtract( frameNum, rgbimage, low_threshold_mask, high_threshold_mask);
		
		Mat theLowResult(low_threshold_mask.Ptr());
		Mat theHighResult(high_threshold_mask.Ptr());
		
		//now apply the mask
		Mat themask = theLowResult > 0.3;//the lower this value the greater the sensitivity
		Mat fGround;
		Mat theSource;
		theSource = smoothed_image;
		theSource.copyTo(fGround, themask);
	
		IplImage* tempFinal = new IplImage(fGround);
		cvResize(tempFinal, result_image);
		
		IplImage* tempUDPFinal = new IplImage(themask);
		cvResize(tempUDPFinal, udp_image);
		
		//IplImage* roi;
		if(hasAllElectrodes == false)
		{
			for(int i=0; i < elecIncrement; i++)
			{
				cvCircle(result_image,                       /* the dest image */
						 electrodes[i], ELECTRODE_CIRCLE_RADIUS,      /* center point and radius */
						 cvScalar(246, 227, 139, 167),    /* the color; red */
						 .5, CV_AA, 0); /* thickness(if -1 = filled), line type, shift */
				
			}
		}
		else
		{
			for(int j=0; j < NUM_ELECTRODES; j++)
			{
				cvCircle(result_image,                       /* the dest image */
						 electrodes[j], ELECTRODE_CIRCLE_RADIUS,      /* center point and radius */
						 cvScalar(246, 227, 139, 167),    /* the color; red */
						 .5, CV_AA, 0); /* thickness(if -1 = filled), line type, shift */
				
			}	
		}
		
		cvShowImage(FOREGROUND_RESULT_NAME, result_image);
		
		//send the UDP data
		
		if(frameNum%FRAMES_BETWEEN_UDP_SENDS == 0)
		{
			//calculate the region of interest
			
			sendUDPMessage();
		}
		
		
		// update background subtraction
		low_threshold_mask.Clear();	// disable conditional updating
		bgs.Update(frameNum, rgbimage, low_threshold_mask);
		
		frameNum++;
		snapCounter++;
		frameCount++;
		
		if(snapCounter >= NUM_FRAMES_BETWEEN_SNAPS && doSnapShots == true)
		{
			snap_image = cvQueryFrame (snapCamera);
			cvShowImage(SNAP_WINDOW_NAME, snap_image);
			
			snapCounter = 0;
			
			ostringstream imageFileName;
			
			time_t now = time(0);
			tm *ltm = localtime(&now);
			
			imageFileName << IMAGE_FILE_NAME << ltm->tm_mon + 1 << "_" << ltm->tm_mday << "_" << ltm->tm_hour << "_" << ltm->tm_min << "_Frame" << frameCount << ".jpg";
			const std::string& tmp1 = imageFileName.str();
			const char* cst = tmp1.c_str();
			cvSaveImage(cst, snap_image, p);
		}
		
		// wait a tenth of a second for keypress and window drawing
        char key = cvWaitKey(1);
		
        if (key == 'q' || key == 'Q')   
		{
			cvDestroyWindow(CAM_WINDOW_NAME);
			cvDestroyWindow(SMOOTHED_WINDOW_NAME);
			cvDestroyWindow(FOREGROUND_RESULT_NAME);
			cvDestroyWindow(LAB_COLOR_WINDOW_NAME);
			cvDestroyWindow(SNAP_WINDOW_NAME);
			
			cvReleaseImage(&cam_image);
			cvReleaseImage(&smoothed_image);
			cvReleaseImage(&lab_image);
			cvReleaseImage(&result_image);
			
            return;
		}
		
		if(key == '0' )
		{
			frameNum = 0;
		}
    }
}

void Painbox::initiateGMM()
{
	width	= (int)cvGetCaptureProperty(camera, CV_CAP_PROP_FRAME_WIDTH);
	height = (int)cvGetCaptureProperty(camera, CV_CAP_PROP_FRAME_HEIGHT);
	
	// setup marks to hold results of low and high thresholding
	low_threshold_mask = cvCreateImage(cvSize(current_frame->width/WINDOW_SCALE, current_frame->height/WINDOW_SCALE), IPL_DEPTH_8U, 1);
	low_threshold_mask.Ptr()->origin = IPL_ORIGIN_BL;
	
	high_threshold_mask = cvCreateImage(cvSize(current_frame->width/WINDOW_SCALE, current_frame->height/WINDOW_SCALE), IPL_DEPTH_8U, 1);
	high_threshold_mask.Ptr()->origin = IPL_ORIGIN_BL;
	
	params.SetFrameSize(width/WINDOW_SCALE, height/WINDOW_SCALE);
	params.LowThreshold() = 3.0f*3.0f;
	params.HighThreshold() = 2*params.LowThreshold();	//Note: high threshold is used by post-processing 
	params.Alpha() = 0.01f;
	params.MaxModes() = 3;
	
	bgs.Initalize(params);
}

string Painbox::getFrameRate()
{
	++numFrames;
	overtime = clock() - nextUpdate;
	
	if (overtime > 0)
	{
		fps = numFrames / ((float)(1 + (float)overtime/(float)CLOCKS_PER_SEC));
		numFrames = 0;
		nextUpdate = clock() + 1 * CLOCKS_PER_SEC;
	}
	
	ostringstream myFPS;
	myFPS << fps;
	
	return "FPS: " + myFPS.str();
}


void Painbox::sendUDPMessage()
{
	if(hasAllElectrodes == false)
	{
		return;
	}
	
	IplImage* roi;
	
	for(int k=0; k < NUM_ELECTRODES; k++)
	{
		roi = cvCreateImage(cvGetSize(udp_image), 8, 1);
		
		/* prepare the 'ROI' image */
		cvZero(roi);
		
		cvCircle(
				 roi,
				 electrodes[k],
				 50,
				 CV_RGB(255, 255, 255),
				 -1, 8, 0
				 );
		
		bgData[k] = cvAvg(udp_image, roi);
		
		cvReleaseImage(&roi);
		
		int bright = (int)bgData[k].val[0];
		
		if(k == 0)
		{
			oscStream << osc::BeginMessage("/1") << bright << osc::EndMessage;
		}
		else if (k == 1)
		{
			oscStream << osc::BeginMessage("/2") << bright << osc::EndMessage;
		}
		else if (k == 2)
		{
			oscStream << osc::BeginMessage("/3") << bright << osc::EndMessage;
		}
		else if (k == 3)
		{
			oscStream << osc::BeginMessage("/4") << bright << osc::EndMessage;
		}
		else if (k == 4)
		{
			oscStream << osc::BeginMessage("/5") << bright << osc::EndMessage;
		}
		else if (k == 5)
		{
			oscStream << osc::BeginMessage("/6") << bright << osc::EndMessage;
		}
		else if (k == 6)
		{
			oscStream << osc::BeginMessage("/7") << bright << osc::EndMessage;
		}
		else if (k == 7)
		{
			oscStream << osc::BeginMessage("/8") << bright << osc::EndMessage;
		}
		else if (k == 8)
		{
			oscStream << osc::BeginMessage("/9") << bright << osc::EndMessage;
		}
		else if (k == 9)
		{
			oscStream << osc::BeginMessage("/10") << bright << osc::EndMessage;
		}
		else if (k == 10)
		{
			oscStream << osc::BeginMessage("/11") << bright << osc::EndMessage;
		}
		cout << "; roi " << k << "has brightness = " << bright;

		transmitSocket.Send(oscStream.Data(), oscStream.Size());
		oscStream.Clear();
	}
}
