
#include "GMMTrain.h"
#include <iostream>
#include <limits>

using namespace std;
using namespace cv;

GMMTrain::GMMTrain(void){
}

void GMMTrain::loadImages(vector<String> fileLocations){
}

Mat GMMTrain::setup(Mat& _source, Mat& source_mask){
	Mat source; 
	_source.convertTo(source,CV_32F,1.0/255.0);
	CvEM source_model;
	
	trainGMM(source_model,source,source_mask);
	
	Mat tempMat = Mat(source_model.get_means());
	
	return tempMat;
}

void GMMTrain::trainGMM(CvEM& source_model, Mat& source, Mat& source_mask){
	int src_samples_size = countNonZero(source_mask);
	Mat source_samples(src_samples_size, 3, CV_32FC1);
	Mat source_32f;
	
	source_32f = source;
	
	int sample_count = 0;
	for(int y=0;y<source.rows;y++) {
		Vec3f* row = source_32f.ptr<Vec3f>(y);
		uchar* mask_row = source_mask.ptr<uchar>(y);
		for(int x=0;x<source.cols;x++) {
			if(mask_row[x] > 0) {
				source_samples.at<Vec3f>(sample_count++,0) = row[x];
			}
		}
	}
	
	source_model.clear();
	CvEMParams ps(3/* = number of gaussians*/);
	source_model.train(source_samples,Mat(),ps,NULL);
}