//
//  DMNPhoto.m
//  Rover
//
//  Created by Nick Reichard on 3/7/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import "DMNPhoto.h"

@implementation DMNPhoto


-(BOOL)isEqual:(id)object
{

        if (!object || ![object isKindOfClass:[DMNPhoto class]]) { return NO; }
        DMNPhoto *photo = object;
        if (photo.photoID != self.photoID) { return NO; }
        if (photo.solDate != self.solDate) { return NO; }
        if (![photo.cameraName isEqualToString:self.cameraName]) { return NO; }
        if (![photo.earthDate isEqualToDate:self.earthDate]) { return NO; }
        return YES;

}

//------------- STACK OVERFLOW ------- 
//- (BOOL)isEqual:(id)object
//{
//    // MONInteger allows a comparison to NSNumber
//    if ([object isKindOfClass:[NSNumber class]]) {
//        NSNumber * other = object;
//        return self.value == other.intValue;
//    }
//    else if (![object isKindOfClass:self.class]) {
//        return NO;
//    }
//    MONInteger * other = object;
//    return self.value == other.value;
//}


@end
