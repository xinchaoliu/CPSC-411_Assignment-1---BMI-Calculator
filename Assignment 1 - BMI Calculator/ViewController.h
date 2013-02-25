//
//  ViewController.h
//  Assignment 1 - BMI Calculator
//
//  Created by Xinchao Liu on 2/19/13.
//  Copyright (c) 2013 Xinchao Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {    
    IBOutlet UITextField * _heightTextField;
    IBOutlet UITextField * _weightTextField;
    IBOutlet UILabel * _rangeLabel;
    IBOutlet UISwitch * _usSwitch;
    IBOutlet UISwitch * _metricSwitch;
    IBOutlet UILabel * _heightLabel;
    IBOutlet UILabel * _weightLabel;
    IBOutlet UILabel * _bmiLabel;
    IBOutlet UIImageView * _image;
}

@property (retain, nonatomic) IBOutlet UIImageView *image;
@property (retain, nonatomic) IBOutlet UITextField *heightTextField;
@property (retain, nonatomic) IBOutlet UITextField *weightTextField;
@property (retain, nonatomic) IBOutlet UILabel *rangeLabel;
@property (retain, nonatomic) IBOutlet UISwitch *usSwitch;
@property (retain, nonatomic) IBOutlet UISwitch *metricSwitch;
@property (retain, nonatomic) IBOutlet UILabel *heightLabel;
@property (retain, nonatomic) IBOutlet UILabel *weightLabel;
@property (retain, nonatomic) IBOutlet UILabel *bmiLabel;

- (IBAction)calculate:(id)sender;
- (IBAction)usSwitchChanged:(id)sender;
- (IBAction)metricSwitchChanged:(id)sender;

@end
