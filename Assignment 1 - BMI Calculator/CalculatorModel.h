//
//  BMICalculator.h
//  Assignment 1 - BMI Calculator
//
//  Created by Xinchao Liu on 2/24/13.
//  Copyright (c) 2013 Xinchao Liu. All rights reserved.
//
//  Email: leo_liu@csu.fullerton.edu
//
//  Due: 23:59, Feb.26, 2013
//
//  File Description: This is the interface for CalculatorModel. It contains
//                    the two calculate BMI methods.

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject

-(double)calculateWithcm:(int)height andkg:(int)weight;
-(double)calculateWithin:(int)height andlbs:(int)weight;

@end
