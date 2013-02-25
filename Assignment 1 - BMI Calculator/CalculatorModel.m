//
//  BMICalculator.m
//  Assignment 1 - BMI Calculator
//
//  Created by Xinchao Liu on 2/24/13.
//  Copyright (c) 2013 Xinchao Liu. All rights reserved.
//

#import "CalculatorModel.h"

@interface CalculatorModel()

@property (assign) double m;
@property (assign) double BMI;

@end

@implementation CalculatorModel

@synthesize m = _m;
@synthesize BMI = _BMI;

-(double)calculateWithcm:(int)height andkg:(int)weight {
    _m = height / 100.0;
    _BMI = weight / (_m * _m);
    return _BMI;    
}

-(double)calculateWithin:(int)height andlbs:(int)weight {
    _m = height * 2.54 / 100.0;
    _BMI = weight * 0.45359237 / (_m * _m);
    return _BMI;
}

@end
