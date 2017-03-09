//
//  DMNMarsRoverClient.h
//  Rover
//
//  Created by Nick Reichard on 3/7/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NLRRover;
@class DMNPhoto;

NS_ASSUME_NONNULL_BEGIN

@interface DMNMarsRoverClient : NSObject

//has a completion block as a parameter that returns an array of rover names, and an error
// The rover names should be an array of strings.
+ (void) fetchAllMarsRoversWithCompletion:(void (^)(NSArray *roverNames, NSError *error))completion;


// takes in a string and has a completion block that returns an instance of your rover model, and an error

+ (void) fetchMissionManifestForRoverNamed:(NSString *)roverName completion :(void (^)(NLRRover *rover, NSError *error))completion;

// that takes in an instance of your rover model, which sol you want photos for, and a completion block that returns an array of photos, and an error

+ (void) fetchPhotosFromRover:(NLRRover *)rover sol:(NSNumber *)sol completion: (void (^)(NSArray *, NSError *))completion;

// that takes in an instance of your photo model, and has a completion block that returns imageData ( NSData, not Data )

+ (void) fetchImageDataForPhoto:(DMNPhoto *)photo completion: (void (^)(NSData *imageData, NSError *error))completion;

+ (NSString *)fetchAPIKeyFromRover;

@end

NS_ASSUME_NONNULL_END


/*-(void)fetchAllMarsRoversWithCompletion:(void(^)(NSArray *rovers, NSError *error))completion;
 -(void)fetchMissionManifestForRoverNamed:(NSString *)roverName completion:(void(^)(DMNRover *rover, NSError *error))completion;
 -(void)fetchPhotosFromRover:(NSString *)roverName sol:(NSNumber *)sol completion:(void(^)(NSArray *photosArray, NSError *error))completion;
 -(void)fetchImageDataForPhoto:(DMNPhoto *)photo completion:(void(^)(NSData *imageData, NSError *error))completion;
 */
