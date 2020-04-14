//
//  FirstResponder.m
//  Quakes-Objc
//
//  Created by Dimitri Bouniol Lambda on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "FirstResponder.h"

//@interface FirstResponder () {
//    NSString *myInternalName;
//}
//
//@end

@implementation FirstResponder

//@synthesize name = _name;
@synthesize name = myInternalName;

// myFirstResponder.name = @"Dimitri"
// [myFirstResponder setName:@"Dimitri"];

- (void)setName:(NSString *)name
{
    // willSet

    myInternalName = name.copy; // [name copy];

    // didSet
}

- (NSString *)name
{
    return myInternalName.copy;
}

@end
