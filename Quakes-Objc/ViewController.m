//
//  ViewController.m
//  Quakes-Objc
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "LSILog.h"
#import "FirstResponder.h"

@interface ViewController ()

@property (nonatomic) int(^blockPropertyName)(int a, int b);

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Hey Quakes!");
    
    FirstResponder *firstResponder = [[FirstResponder alloc] init];
    
    NSLog(@"firstResponder: %@", firstResponder);
    NSLog(@"firstResponder.name: %@", firstResponder.name);
    
    // Objective-C: nil
    // C: NULL
    // Primitive: 0
    
    firstResponder.name = @"Dimitri";
    NSLog(@"firstResponder.name: %@", firstResponder.name);
    
    int (^performMathOnNumbers)(int a, int b) = ^int(int a, int b) {
        return a + b;
    };
    
    int result = performMathOnNumbers(5, 8);
    NSLog(@"The sum is: %d", result);
    
    performMathOnNumbers = ^int(int a, int b) {
           return a * b;
       };
    
    result = performMathOnNumbers(5, 8);
    NSLog(@"The product is: %d", result);
    
    self.blockPropertyName = performMathOnNumbers;
    
    result = self.blockPropertyName(5, 8);
    NSLog(@"The product is: %d", result);
    
    self.blockPropertyName = ^int(int a, int b) {
        return a*2 + b*3;
    };
    
    result = self.blockPropertyName(5, 8);
    NSLog(@"The result is: %d", result);
    
    // access ivar directly
//    _blockPropertyName
//    self->_blockPropertyName
    
    // access getter method
//    self.blockPropertyName
//    [self blockPropertyName]
}


@end
