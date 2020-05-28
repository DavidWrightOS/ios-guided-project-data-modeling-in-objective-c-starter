//
//  NSDateInterval+DayAdditions.h
//  Quakes-Objc
//
//  Created by David Wright on 5/27/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDateInterval (DayAdditions)

+ (NSDateInterval *)lsi_dateIntervalByAddingDays:(NSInteger)days;
+ (NSDateInterval *)lsi_dateIntervalByAddingDays:(NSInteger)days toDate:(NSDate *)aDate;

@end

NS_ASSUME_NONNULL_END
