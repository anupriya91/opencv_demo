//
//  OpenCVWrapper.m
//  opencv-demo
//
//  Created by Daniel Saha on 7/18/16.
//  Copyright © 2016 Daniel Saha. All rights reserved.
//
using namespace std;
#import "OpenCVWrapper.h"
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>


@implementation OpenCVWrapper


+(NSString *) openCVVersionString{
    return [NSString stringWithFormat: @"OpenCV Version %s", CV_VERSION];
    
}

+(UIImage *) makeGrayFromImage:(UIImage *)image {
    cv::Mat imageMat;
    UIImageToMat(image, imageMat);
    if (imageMat.channels() == 1) return image;
    
    cv::Mat grayMat;
    cv::cvtColor(imageMat,grayMat, CV_BGR2GRAY);
    
    return MatToUIImage(grayMat);
    
}

+(UIImage *) subtractImages :(UIImage *) image1  :(UIImage *) image2{
    cv::Mat imageMat1;
    UIImageToMat(image1, imageMat1);
    cv::cvtColor(imageMat1,imageMat1, CV_RGB2GRAY);

    
    cv::Mat imageMat2;
    UIImageToMat(image2, imageMat2);
    cv::cvtColor(imageMat2,imageMat2, CV_RGB2GRAY);

    cout << "imageMat1 " << imageMat1.rows  << imageMat1.cols <<endl;

    cout << "imageMat2 " << imageMat2.rows  << imageMat2.cols <<endl;
    
    cv::Mat imageMat3;
    cv::add(imageMat1, imageMat2, imageMat3);

    
    
    return MatToUIImage(imageMat3);
    
}




@end