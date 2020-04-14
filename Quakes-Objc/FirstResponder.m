//
//  FirstResponder.m
//  Quakes-Objc
//
//  Created by Dimitri Bouniol Lambda on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "FirstResponder.h"

@implementation FirstResponder

// myFirstResponder.name = @"Dimitri"
// [myFirstResponder setName:@"Dimitri"];

- (void)setName:(NSString *)name
{
    // willSet
    
    _name = name.copy; // [name copy];
    
    // didSet
}

@end
