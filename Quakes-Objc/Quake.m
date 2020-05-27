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
    
    NSNumber *place = [properties objectForKey:@"place"];
    if (![place isKindOfClass:[NSString class]]) return nil;
    
    NSNumber *timeInMilliseconds = [properties objectForKey:@"time"];
    if (![timeInMilliseconds isKindOfClass:[NSNumber class]]) return nil;
    
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:timeInMilliseconds.longValue/1000.];
    
    
    NSDictionary *geometry = [dictionary objectForKey:@"geometry"];
    if (![geometry isKindOfClass:[NSDictionary class]]) return nil;
    
    NSArray *coordinates = [properties objectForKey:@"coordinates"];
    if (![coordinates isKindOfClass:[NSArray class]]) return nil;
    
    NSNumber *latitudeNumber = nil;
    NSNumber *longitudeNumber = nil;
    
    if (coordinates.count >= 2) {
        latitudeNumber = [coordinates objectAtIndex:0];
        longitudeNumber = [coordinates objectAtIndex:1];
        if (![latitudeNumber isKindOfClass:[NSNumber class]]) return nil;
        if (![longitudeNumber isKindOfClass:[NSNumber class]]) return nil;
    }
    
    return [self initWithMagnitude:magnitudeNumber.doubleValue
                             place:place
                              time:time
                          latitude:latitudeNumber.doubleValue
                         longitude:longitudeNumber.doubleValue
                              type:nil
                             alert:nil];
}

@end
