//
//  BMICalculator.h
//  Assignment 1 - BMI Calculator
//
//  Created by Xinchao Liu on 2/24/13.
//  Copyright (c) 2013 Xinchao Liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject

-(double)calculateWithcm:(int)height andkg:(int)weight;
-(double)calculateWithin:(int)height andlbs:(int)weight;

@end
