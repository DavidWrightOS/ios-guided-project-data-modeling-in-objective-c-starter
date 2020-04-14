//
//  Quake.h
//  Quakes-Objc
//
//  Created by Dimitri Bouniol Lambda on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Quake : NSObject

- (instancetype)initWithMagnitude:(double)magnitude
                            place:(NSString *)place
                             time:(NSDate *)time
                         latitude:(double)latitude
                        longitude:(double)longitude;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, readonly) double magnitude;
@property (nonatomic, readonly, copy) NSString *place;
@property (nonatomic, readonly) NSDate *time;
@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

@end

NS_ASSUME_NONNULL_END
