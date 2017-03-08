//
//  DMNMarsRoverClient.m
//  Rover
//
//  Created by Nick Reichard on 3/7/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//
// This will be where we make the network calls to get the JSON from NASA's API.



#import "DMNMarsRoverClient.h"
#import "DMNPhoto.h"

@implementation DMNMarsRoverClient : NSObject 

+ (NSString *)apiKey {
    static NSString *apiKey = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *apiKeysURL = [[NSBundle mainBundle] URLForResource:@"APIKeys" withExtension:@"plist"];
        if (!apiKeysURL) {
            NSLog(@"Error! APIKeys file not found!");
            return;
        }
        NSDictionary *apiKeys = [[NSDictionary alloc] initWithContentsOfURL:apiKeysURL];
        apiKey = apiKeys[@"APIKey"];
    });
    return apiKey;
}

@end
