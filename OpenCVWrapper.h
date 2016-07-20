//
//  OpenCVWrapper.h
//  opencv-demo
//
//  Created by Daniel Saha on 7/18/16.
//  Copyright © 2016 Daniel Saha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OpenCVWrapper : NSObject

+(NSString *) openCVVersionString;
+(UIImage *) makeGrayFromImage: (UIImage *)image;
+(UIImage *) subtractImages :(UIImage *) image1  :(UIImage *) image2;
+(UIImage *) cleanse:(UIImage *)image;
@end
