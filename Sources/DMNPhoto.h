//
//  DMNPhoto.h
//  Rover
//
//  Created by Nick Reichard on 3/7/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DMNPhoto : NSObject

- (instancetype) initWithPhotoID:(NSString *)photoID solDate:(NSDate *)solDate cameraName:(NSString *)cameraName earthDate:(NSDate *)earthDate urlImage:(NSString *)urlImage;

@property (nonatomic, copy) NSString *photoID;
@property (nonatomic, copy) NSDate *solDate;
@property (nonatomic, copy) NSString *cameraName;
@property (nonatomic, copy) NSDate *earthDate;
@property (nonatomic, copy) NSString *urlImage; 

@end
