//
//  QuakeFetcher.m
//  Quakes-Objc
//
//  Created by David Wright on 5/27/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "QuakeFetcher.h"
#import "NSDateInterval+DayAdditions.h"

static NSString *const QuakeFetcherBaseURLString = @"https://earthquake.usgs.gov/fdsnws/event/1/query";

@implementation QuakeFetcher

- (void)fetchQuakesWithCompletionHandler:(nonnull QuakeFetcherCompletionHandler)completionHandler
{
    NSDateInterval *pastWeek = [NSDateInterval lsi_dateIntervalByAddingDays:-7];
    [self fetchQuakesInTimeInterval:pastWeek
                  completionHandler:completionHandler];
}
- (void)fetchQuakesInTimeInterval:(NSDateInterval *)interval
                completionHandler:(QuakeFetcherCompletionHandler)completionHandler
{
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:QuakeFetcherBaseURLString];
    
    NSISO8601DateFormatter *formatter = [[NSISO8601DateFormatter alloc] init];
    
    NSString *startTimeString = [formatter stringFromDate:interval.startDate];
    NSString *entTimeString = [formatter stringFromDate:interval.endDate];
}

@end
