//
//  ViewController.m
//  Assignment 1 - BMI Calculator
//
//  Created by Xinchao Liu on 2/19/13.
//  Copyright (c) 2013 Xinchao Liu. All rights reserved.
//
//  Email: leo_liu@csu.fullerton.edu
//
//  Due: 23:59, Feb.26, 2013
//
//  File Description: This is the ViewController's implementation. It collects
//                    all the information from the View, talks with the model to
//                    get all the results, then makes changes to the View.

#import "ViewController.h"
#import "CalculatorModel.h"

@interface ViewController () {
    NSString * _rangeString;
    BOOL _isUSMeasures;
    int _height;
    int _weight;
    double _bmi;
}

@property (retain, nonatomic) NSString *rangeString;
@property (assign) BOOL isUSMeasures;
@property (retain, nonatomic) CalculatorModel *cal;
@property (assign) int height;
@property (assign) int weight;
@property (assign) double bmi;

@end

@implementation ViewController

// Create getters and setters for all the properties
@synthesize isUSMeasures = _isUSMeasures;
@synthesize rangeString = _rangeString;
@synthesize heightLabel = _heightLabel;
@synthesize weightLabel = _weightLabel;
@synthesize heightTextField  = _heightTextField;
@synthesize weightTextField = _weightTextField;
@synthesize rangeLabel = _rangeLabel;
@synthesize usSwitch = _usSwitch;
@synthesize metricSwitch = _metricSwitch;
@synthesize bmiLabel = _bmiLabel;
@synthesize image = _image;
@synthesize cal = _cal;
@synthesize height = _height;
@synthesize weight = _weight;
@synthesize bmi = _bmi;

// Rewrite the getter method of cal to initialize CallculatorModel
- (CalculatorModel *) cal {
    if (!_cal)
        _cal = [[CalculatorModel alloc] init];
    return _cal;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isUSMeasures = YES; // Initially set to use the US measures
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculate:(id)sender {

    if ([_heightTextField.text length] == 0 &&
        [_weightTextField.text length] == 0) {
        self.rangeString = @"Please input your height & weight";
        self.rangeLabel.text = _rangeString;
    }
    // If the both the textfields are empty, then ask the user to input them.
    else if ([_heightTextField.text length] == 0) {
        self.rangeString = @"Please input your height";
        self.rangeLabel.text = _rangeString;
    }
    // Then if only the height textfield is empty, asks for the height.
    else if ([_weightTextField.text length] == 0) {
        self.rangeString = @"Please input your weight";
        self.rangeLabel.text = _rangeString;
    }
    // The same for weight textfield.
    else {
        _height = [_heightTextField.text intValue];
        _weight = [_weightTextField.text intValue];
        // Since both height and weight are typed, get those values.
        if (_isUSMeasures)
            _bmi = [self.cal calculateWithin:_height andlbs:_weight];
        else
            _bmi = [self.cal calculateWithcm:_height andkg:_weight];
        // Use the methods from CalculatorModel to calculate
        // the BMI with the choosen measures.
        self.bmiLabel.text = [NSString stringWithFormat:@"%.2f",_bmi];
        // Display the BMI result in %.2f format.
        if (_bmi < 16.00) {
            self.rangeLabel.text = @"Severe Thinness";
            [self.image setImage:[UIImage imageNamed:@"severe thinness.png"]];
        }
        else if (_bmi < 16.99) {
            self.rangeLabel.text = @"Moderate Thinness";
            [self.image setImage:[UIImage imageNamed:@"moderate thinness.png"]];
        }
        else if (_bmi < 18.49) {
            self.rangeLabel.text = @"Mild Thinness";
            [self.image setImage:[UIImage imageNamed:@"mild thinness.png"]];
        }
        else if (_bmi < 24.99) {
            self.rangeLabel.text = @"Normal Range";
            [self.image setImage:[UIImage imageNamed:@"normal range.png"]];
        }
        else if (_bmi < 29.99) {
            self.rangeLabel.text = @"Overweight";
            [self.image setImage:[UIImage imageNamed:@"overweight.png"]];
        }
        else if (_bmi < 34.99) {
            self.rangeLabel.text = @"Obese Class I (Moderate)";
            [self.image setImage:[UIImage imageNamed:@"moderate.png"]];
        }
        else if (_bmi < 39.99) {
            self.rangeLabel.text = @"Obese Class II (Severe)";
            [self.image setImage:[UIImage imageNamed:@"severe.png"]];
        }
        else {
            self.rangeLabel.text = @"Obese Class III (Very Severe)";
            [self.image setImage:[UIImage imageNamed:@"very severe.png"]];
        }
        // Change the rangeLabel to show the BMI range and
        // show a picture for each range of BMI.
    }
}

// This method make sure that when user finish input their height or weight,
// they can touch any where of the background to disapper the keyboard.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    UIView *view = (UIView *)[touch view];
    if (view == self.view) {
    [self.heightTextField resignFirstResponder];
    [self.weightTextField resignFirstResponder];
    }
}

// When user touch the switches, another switch will change its value
// at the same time, so that only one switch is on at any time.
- (IBAction)usSwitchChanged:(id)sender {
    self.isUSMeasures = !_isUSMeasures;
    // First reverse the measures.
    // If it's not the US measures then it is the metric measures for sure.
    [self.metricSwitch setOn:!_isUSMeasures animated:YES];
    // If not using the US measures then turn on the metricSwitch, vice versa.
    self.heightTextField.text = @"";
    self.weightTextField.text = @"";
    // Clean the textFields for next calculate.
    self.bmiLabel.text = @"";    
    self.rangeLabel.text = @"BMI Calculator";
    // Clean the BMI and Range Labels
    [self.image setImage:[UIImage imageNamed:@""]];
    // Clean the BMI image
    if(_isUSMeasures) {
        self.heightLabel.text = @"in";
        self.weightLabel.text = @"lbs";
    }
    else {
        self.heightLabel.text = @"cm";
        self.weightLabel.text = @"kg";
    }
    // Change the measurement as well
}

// The same process as the US Measures switch
- (IBAction)metricSwitchChanged:(id)sender {
    self.isUSMeasures = !_isUSMeasures;
    [self.usSwitch setOn:_isUSMeasures animated:YES];
    self.heightTextField.text = @"";
    self.weightTextField.text = @"";
    self.bmiLabel.text = @"";
    self.rangeLabel.text = @"BMI Calculator";
    [self.image setImage:[UIImage imageNamed:@""]];
    if(_isUSMeasures) {
        self.heightLabel.text = @"in";
        self.weightLabel.text = @"lbs";
    }
    else {
        self.heightLabel.text = @"cm";
        self.weightLabel.text = @"kg";
    }
}

- (void)dealloc {
    [_heightTextField release];
    [_weightTextField release];
    [_rangeLabel release];
    [_usSwitch release];
    [_metricSwitch release];
    [_heightLabel release];
    [_weightLabel release];
    [_bmiLabel release];
    [_image release];
    [super dealloc];
}

@end
