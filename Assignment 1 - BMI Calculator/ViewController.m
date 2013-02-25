//
//  ViewController.m
//  Assignment 1 - BMI Calculator
//
//  Created by Xinchao Liu on 2/19/13.
//  Copyright (c) 2013 Xinchao Liu. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorModel.h"

@interface ViewController () {
    NSString * _rangeString;
    BOOL _isUSMeasure;
    int _height;
    int _weight;
    double _bmi;
}

@property (retain, nonatomic) NSString *rangeString;
@property (assign) BOOL isUSMeasure;
@property (retain, nonatomic) CalculatorModel *cal;
@property (assign) int height;
@property (assign) int weight;
@property (assign) double bmi;

@end

@implementation ViewController

@synthesize isUSMeasure = _isUSMeasure;
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


- (CalculatorModel *) cal {
    if (!_cal)
        _cal = [[CalculatorModel alloc] init];
    return _cal;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isUSMeasure = YES;
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
    else if ([_heightTextField.text length] == 0) {
        self.rangeString = @"Please input your height";
        self.rangeLabel.text = _rangeString;
    }
    else if ([_weightTextField.text length] == 0) {
        self.rangeString = @"Please input your weight";
        self.rangeLabel.text = _rangeString;
    }
    else {
        self.rangeLabel.text = _rangeString;
        _height = [_heightTextField.text intValue];
        _weight = [_weightTextField.text intValue];
        if (_isUSMeasure)
            _bmi = [self.cal calculateWithin:_height andlbs:_weight];
        else
            _bmi = [self.cal calculateWithcm:_height andkg:_weight];
        self.bmiLabel.text = [NSString stringWithFormat:@"%.2f",_bmi];
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
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    UIView *view = (UIView *)[touch view];
    if (view == self.view) {
    [self.heightTextField resignFirstResponder];
    [self.weightTextField resignFirstResponder];
    }
}

- (IBAction)usSwitchChanged:(id)sender {
    self.isUSMeasure = !_isUSMeasure;
    [self.metricSwitch setOn:!_isUSMeasure animated:YES];
    self.heightTextField.text = @"";
    self.weightTextField.text = @"";
    self.bmiLabel.text = @"";    
    self.rangeLabel.text = @"BMI Calculator";
    [self.image setImage:[UIImage imageNamed:@""]];
    if(_isUSMeasure) {
        self.heightLabel.text = @"in";
        self.weightLabel.text = @"lbs";
    }
    else {
        self.heightLabel.text = @"cm";
        self.weightLabel.text = @"kg";
    }
}

- (IBAction)metricSwitchChanged:(id)sender {
    self.isUSMeasure = !_isUSMeasure;
    [self.usSwitch setOn:_isUSMeasure animated:YES];    
    self.heightTextField.text = @"";
    self.weightTextField.text = @"";
    self.bmiLabel.text = @"";
    self.rangeLabel.text = @"BMI Calculator";
    [self.image setImage:[UIImage imageNamed:@""]];
    if(_isUSMeasure) {
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
