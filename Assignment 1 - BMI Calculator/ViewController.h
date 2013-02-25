//
//  ViewController.h
//  Assignment 1 - BMI Calculator
//
//  Created by Xinchao Liu on 2/19/13.
//  Copyright (c) 2013 Xinchao Liu. All rights reserved.
//
//  Email: leo_liu@csu.fullerton.edu
//
//  Due: 23:59, Feb.26, 2013
//
//  File Description: This is the ViewController's interface. Here's all the
//                    connections to the view.

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {    
    IBOutlet UITextField * _heightTextField;
    // The textField for users to input their height.
    IBOutlet UITextField * _weightTextField;
    // The textField for users to input their weight.
    IBOutlet UILabel * _rangeLabel;
    // A Label to show the BMI range and other informations.
    IBOutlet UISwitch * _usSwitch;
    IBOutlet UISwitch * _metricSwitch;
    // The two switches control the measurements used to calculate the BMI.
    IBOutlet UILabel * _heightLabel;
    // Label shows |cm| or |in|
    IBOutlet UILabel * _weightLabel;
    // Label shows |kg| or |lbs|
    IBOutlet UILabel * _bmiLabel;
    // This is the label that will show the BMI number result.
    IBOutlet UIImageView * _image;
    // A UIImageView to display a picture for each BMI range.
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
// The associated action for the calculate button.
- (IBAction)usSwitchChanged:(id)sender;
- (IBAction)metricSwitchChanged:(id)sender;
// Two actions for the measures switches.

@end
