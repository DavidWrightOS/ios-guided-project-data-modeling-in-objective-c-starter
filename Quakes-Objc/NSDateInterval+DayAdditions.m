//
//  NSDateInterval+DayAdditions.m
//  Quakes-Objc
//
//  Created by David Wright on 5/27/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "NSDateInterval+DayAdditions.h"

@implementation NSDateInterval (DayAdditions)

+ (NSDateInterval *)lsi_dateIntervalByAddingDays:(NSInteger)days
{
    return [self lsi_dateIntervalByAddingDays:days toDate:NSDate.now];
}

+ (NSDateInterval *)lsi_dateIntervalByAddingDays:(NSInteger)days toDate:(NSDate *)aDate
{
    NSDate *startDate = nil;
    NSDate *endDate = nil;
    
    if (days < 0) {
        endDate = aDate;
        startDate = [NSCalendar.currentCalendar dateByAddingUnit:NSCalendarUnitDay value:days toDate:endDate options:0];
    } else {
        startDate = aDate;
        endDate = [NSCalendar.currentCalendar dateByAddingUnit:NSCalendarUnitDay value:days toDate:startDate options:0];
    }
    return [[self alloc] initWithStartDate:startDate endDate:endDate];
}

@end
