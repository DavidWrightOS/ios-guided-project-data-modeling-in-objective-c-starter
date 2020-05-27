//
//  FirstResponder.m
//  Quakes-Objc
//
//  Created by David Wright on 5/25/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "FirstResponder.h"

// Custom Class Extension
//@interface FirstResponder () {
//    NSString *myInternalName;
//}
//
//@end

@implementation FirstResponder

// @synthesize name;
// @synthesize name = _name;
@synthesize name = myInternalName;

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
