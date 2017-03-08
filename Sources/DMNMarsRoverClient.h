//
//  DMNMarsRoverClient.h
//  Rover
//
//  Created by Nick Reichard on 3/7/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMNPhoto.h"
#import "NLRRover.h"


@interface DMNMarsRoverClient : NSObject

//has a completion block as a parameter that returns an array of rover names, and an error
// The rover names should be an array of strings.
+ (void) fetchAllMarsRoversWithCompletion:(void (^)(NSArray *, NSError *))completion;

// takes in a string and has a completion block that returns an instance of your rover model, and an error

+ (void) fetchMissionManifestForRoverNamed:(NSString *)roverName completion :(void (^)(NLRRover *, NSError *))completion;

// that takes in an instance of your rover model, which sol you want photos for, and a completion block that returns an array of photos, and an error

+ (void) fetchPhotosFromRover:(NLRRover *)recentPhotoMax completion: (void (^)(NSArray *, NSError *))completion;

// that takes in an instance of your photo model, and has a completion block that returns imageData ( NSData, not Data )

+ (void) fetchImageDataForPhoto:(DMNPhoto *) completion: (void (^)(NSData *))completion;

+ (NSString *)fetchAPIKeyFromPlist;

@end
