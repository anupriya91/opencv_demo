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

    cv::Mat grayMat;

    cv::threshold(imageMat, grayMat, 250, 255, CV_THRESH_BINARY);
    
    return MatToUIImage(grayMat);
    
}

+(UIImage *) subtractImages :(UIImage *) image1  :(UIImage *) image2{
    
    cv::Mat imageMat1;
    UIImageToMat(image1, imageMat1);
    
    cv::Mat imageMat2;
    UIImageToMat(image2, imageMat2);    
    //cout << "imageMat1 " << imageMat1.rows  << imageMat1.cols <<endl;
    //cout << "imageMat2 " << imageMat2.rows  << imageMat2.cols <<endl;
//    cout << "imageMat1 " << imageMat1.type() <<endl;
//    cout << "imageMat2 " << imageMat2.type() <<endl;
    
    cv::Mat imageMat3;
    cv::bitwise_not(imageMat1, imageMat1);
    cv::bitwise_or(imageMat1, imageMat2, imageMat3);
    //cv::bitwise_xor(imageMat1, imageMat2, imageMat3);
    return MatToUIImage(imageMat3);
    
}

+(UIImage *) cleanse:(UIImage *)image {
    cv::Mat imageMat1;
    UIImageToMat(image, imageMat1);
    return MatToUIImage(imageMat1);
}

@end