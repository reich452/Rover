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
#import "Rover-Swift.h"

static NSString * const baseURLString = @"https://api.nasa.gov/mars-photos/api/v1/";


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


//Create a class method called baseURL that returns an instance of NSURL created from the base url of the API. NSURL *baseURL = [NSURL URLWithString:baseURLString];

+(NSURL *) baseURL
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    return baseURL;
}


// Create a class method called URLForInfoForRover that takes in a string called 'roverName' and returns an NSURL pointing to the mission manifest of the rover passed in. (hint: It should return an instance of NSURL created using the baseURL and the information passed in to create a more specific url pointing to the information for that mission)

+(NSURL *)URLForInfoForRover:(NSString *)roverName

{
    NSURL *url = [[self baseURL] URLByAppendingPathComponent:@"/mainfests/"];
    NSURL *urlWithRoverName = [url URLByAppendingPathComponent:roverName];
    return urlWithRoverName;
}

// Create a class method called urlForPhotosFromRover that takes in a string called 'roverName' and the sol that you want photos for, then like above, return a new, more specific NSURL pointing to the photos for the given rover and sol.
+(NSURL *)urlForPhotosFromRover:(NSString *)roverName photos:(NSInteger)sol
{
    NSURL *url = [self baseURL];
    url = [url URLByAppendingPathComponent:@"rovers"];
    url = [url URLByAppendingPathComponent:roverName];
    url = [url URLByAppendingPathComponent:@"photos"];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    urlComponents.queryItems = @[[NSURLQueryItem queryItemWithName:@"sol" value:[@(sol) stringValue]],
                                 [NSURLQueryItem queryItemWithName:@"api_key" value:[self apiKey]]];
    return urlComponents.URL;
}

+(void) fetchAllMarsRoversWithCompletion:(void (^)(NSArray *roverNames, NSError *error))completion

{
    NSString *baseURLString = @"https://api.nasa.gov/mars-photos/api/v1/";
    
    NSURL *baseURL = [[NSURL alloc] initWithString:baseURLString];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    
    // The way we want it to be fromated. like the dateStyle in journal
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"api_key" value: [self fetchAPIKeyFromRover]];
    [[[NSURLSession sharedSession] dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", error);
            return completion(nil, error);
        }
        
        if (!data) {
            return completion(nil, [NSError errorWithDomain:@"com.DevMountain.Rover.ErrorDomain"code:-1 userInfo:nil]);
        }
        NSDictionary *jsonRover = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSArray *roverDicts = nil;
        if (!jsonRover || ![jsonRover isKindOfClass:[NSDictionary class]] || !(roverDicts = jsonRover[@"rovers"])) {
            NSLog(@"error parsing JSON %@", error);
            return completion(nil, error);
        }
        
        NSMutableArray *roverNames = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in roverDicts) {
            NSString *name = dict[@"name"];
            if (name) { [roverNames addObject:name]; }
        }
        completion(roverNames, nil);
    }] resume];
}

+(void) fetchImageDataForPhoto:(DMNPhoto *)photo completion:(void (^)(NSData * _Nonnull, NSError * _Nonnull))completion

{
    
}

+(void) fetchPhotosFromRover:(NLRRover *)rover sol:(NSNumber *)sol completion:(void (^)(NSArray * _Nonnull, NSError * _Nonnull))completion
{
    
}

+(void) fetchMissionManifestForRoverNamed:(NSString *)roverName completion:(void (^)(NLRRover * _Nonnull, NSError * _Nonnull))completion
{
    
}


@end
