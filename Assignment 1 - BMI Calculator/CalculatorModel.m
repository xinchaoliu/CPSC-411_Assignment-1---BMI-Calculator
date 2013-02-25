//
//  BMICalculator.m
//  Assignment 1 - BMI Calculator
//
//  Created by Xinchao Liu on 2/24/13.
//  Copyright (c) 2013 Xinchao Liu. All rights reserved.
//
//  Email: leo_liu@csu.fullerton.edu
//
//  Due: 23:59, Feb.26, 2013
//
//  File Description: This is the implementation for CalculatorModel.
//                    It receives the values from the ViewController and
//                    compute the BMI then returns the value.

#import "CalculatorModel.h"

@interface CalculatorModel()

@property (assign) double m;
@property (assign) double BMI;
// BMI = KG/m^2

@end

@implementation CalculatorModel

@synthesize m = _m;
@synthesize BMI = _BMI;

-(double)calculateWithcm:(int)height andkg:(int)weight {
    _m = height / 100.0;
    // 1m = 100cm. So height / 100 is the m.
    _BMI = weight / (_m * _m);
    // Compute BMI using the formula.
    return _BMI;
    // return the result.
}

-(double)calculateWithin:(int)height andlbs:(int)weight {
    _m = height * 2.54 / 100.0;
    // First convert inch to cm, then convert to m.
    _BMI = weight * 0.45359237 / (_m * _m);
    // First convert lbs to kg, then compute the BMI normally.
    return _BMI;
}

@end
