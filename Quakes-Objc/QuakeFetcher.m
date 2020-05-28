//
//  QuakeFetcher.m
//  Quakes-Objc
//
//  Created by David Wright on 5/27/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "QuakeFetcher.h"
#import "NSDateInterval+DayAdditions.h"
#import "QuakeResults.h"
#import "Quake.h"

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
    NSString *endTimeString = [formatter stringFromDate:interval.endDate];
    
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"format" value:@"geojson"],
        [NSURLQueryItem queryItemWithName:@"starttime" value:startTimeString],
        [NSURLQueryItem queryItemWithName:@"endtime" value:endTimeString],
    ];
    
    NSURL *url = urlComponents.URL;
    NSLog(@"Fetching Quakes: %@", url);
    
//    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//
//    }];
//    [dataTask resume];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Error fetching quakes: %@", error);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, error);
            });
            
            return;
        }
        
        NSError *jsonError;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (!dictionary) {
            NSLog(@"Error decoding JSON: %@", jsonError);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(nil, jsonError);
            });
            
            return;
        }
        
    }] resume];
}

@end
