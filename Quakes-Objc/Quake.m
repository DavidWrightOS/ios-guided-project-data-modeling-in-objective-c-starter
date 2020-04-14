//
//  Quake.m
//  Quakes-Objc
//
//  Created by Dimitri Bouniol Lambda on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "Quake.h"

@implementation Quake

- (instancetype)initWithMagnitude:(double)magnitude place:(NSString *)place time:(NSDate *)time latitude:(double)latitude longitude:(double)longitude
{
    if (self = [super init]) {
        _magnitude = magnitude;
        _place = place.copy;
        _time = time;
        _latitude = latitude;
        _longitude = longitude;
    }
    
    return self;
}

@end
