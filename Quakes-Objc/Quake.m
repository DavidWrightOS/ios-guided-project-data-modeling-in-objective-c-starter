//
//  Quake.m
//  Quakes-Objc
//
//  Created by David Wright on 5/26/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "Quake.h"

@implementation Quake

- (instancetype)initWithMagnitude:(double)magnitude place:(NSString *)place time:(NSDate *)time latitude:(double)latitude longitude:(double)longitude type:(NSString *)type alert:(NSString *)alert
{
    if (self = [super init]) {
        _magnitude = magnitude;
        _place = place.copy;
        _time = time;
        _latitude = latitude;
        _longitude = longitude;
        _type = type.copy;
        _alert = alert.copy;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *properties = [dictionary objectForKey:@"properties"];
    if (![properties isKindOfClass:[NSDictionary class]]) return nil;
    
    NSNumber *magnitudeNumber = [properties objectForKey:@"mag"];
    if (![magnitudeNumber isKindOfClass:[NSNumber class]]) return nil;
    
    return [self initWithMagnitude:magnitudeNumber.doubleValue
                             place:nil
                              time:nil
                          latitude:0
                         longitude:0
                              type:nil
                             alert:nil];
}

@end
