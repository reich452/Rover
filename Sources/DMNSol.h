//
//  DMNSol.h
//  Rover
//
//  Created by Nick Reichard on 3/7/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMNSol : NSObject

- (instancetype)initWithSolID:(NSString *)solID photoAmount:(NSString *)photoAmount cameraArray:(NSArray *)cammeraArray;

@property (nonatomic, copy) NSString* solID;
@property (nonatomic, copy) NSString* photoAmount;
@property (nonatomic, copy) NSArray* cameraArray; 

@end
