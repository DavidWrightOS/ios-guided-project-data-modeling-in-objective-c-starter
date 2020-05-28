//
//  QuakeFetcher.h
//  Quakes-Objc
//
//  Created by David Wright on 5/27/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^QuakeFetcherCompletionHandler)(NSArray * _Nullable quakes, NSError * _Nullable error);

//NS_ASSUME_NONNULL_BEGIN

@interface QuakeFetcher : NSObject

- (void)fetchQuakesWithCompletionHandler:(nonnull QuakeFetcherCompletionHandler)completionHandler;

- (void)fetchQuakesInTimeInterval:(nonnull NSDateInterval *)interval completionHandler:(nonnull QuakeFetcherCompletionHandler)completionHandler;

@end

//NS_ASSUME_NONNULL_END
