#include "ColorExtract.h"
#include <stdio.h>
#include <stream.h>
#include <cassert>
#include <iostream>

using namespace std;
using namespace cv;

ColorExtract::ColorExtract(char windowName, int frameWidth, int frameHeight, double minR, double minG, double minB, double maxR, double maxG, double maxB)
	{
		window_name = windowName;
		
		color_mask = cvCreateImage(cvSize(frameWidth, frameHeight), 8, 1);
		
		min_color = cvScalar(minR, minG, minB);
		max_color = cvScalar(maxR, maxG, maxB);
	}
	
IplImage* ColorExtract::getContour(IplImage* src, int theWidth, int theHeight)
	{
		IplImage* dst = cvCreateImage(cvSize(theWidth, theHeight), 8, 3);
		storage = cvCreateMemStorage(0);
		contour = 0;
		
		//Find the pixels within the color-range, and put the output in the color_mask
		cvInRangeS(src, min_color, max_color, color_mask);
		
		cvFindContours(src, storage, &contour, sizeof(CvContour), CV_RETR_CCOMP, CV_CHAIN_APPROX_SIMPLE);
		cvZero(dst);
		
		for(; contour != 0; contour = contour->h_next)
        {
            CvScalar color = CV_RGB(rand(), rand(), rand());
            /* replace CV_FILLED with 1 to see the outlines */
            cvDrawContours(dst, contour, color, color, -1, CV_FILLED, 8);
        }
		
		return dst;
	}