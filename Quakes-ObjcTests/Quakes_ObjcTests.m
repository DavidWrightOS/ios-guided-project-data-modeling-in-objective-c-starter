//
//  Quakes_ObjcTests.m
//  Quakes-ObjcTests
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "../Quakes-Objc/LambdaSDK/LSIFileHelper.h"
#import "LSILog.h"

@interface Quakes_ObjcTests : XCTestCase

@end

@implementation Quakes_ObjcTests

- (void)testQuakeParsing
{
    NSData *quakeData = loadFile(@"Quake.json", [Quakes_ObjcTests class]);
    
//    NSLog(@"quake (as data): %@", quakeData);
    
    NSString *quakeJSONString = [[NSString alloc] initWithData:quakeData encoding:NSUTF8StringEncoding];
    NSLog(@"quake (as string): %@", quakeJSONString);
    
    
}

@end
