//
//  NLRRover.h
//  Rover
//
//  Created by Nick Reichard on 3/7/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NLRRover : NSObject

-(instancetype)initWithName:(NSString *)name launchDate:(NSDate *)launchDate landingDate:(NSDate *)landingDate recentPhotoMax:(NSInteger *)recentPhotoMax maxDateEarthPhoto:(UIImage *)maxDateEarthPhoto numberOfPhotos:(NSString *)numberOfPhotos solDescriptions:(NSArray *)solDescriptions;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary; 

// Standard industy practice
typedef NS_ENUM(NSInteger, NLRRoverStatus) {
    NLRRoverStatusActive,
    NLRRoverStatusCompleted
};

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSDate* launchDate;
@property (nonatomic, copy) NSDate* landingDate;
@property (nonatomic, copy) NSString* recentPhotoMax;
@property (nonatomic, copy) NSString* numberOfPhotots;
@property (nonatomic, copy) NSArray* solDescriptions;
@property (nonatomic, copy) NSString* maxDateEarthPhoto; 
