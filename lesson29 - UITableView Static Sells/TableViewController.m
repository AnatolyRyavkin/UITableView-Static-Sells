//
//  TableViewController.m
//  lesson29 - UITableView Static Sells
//
//  Created by Anatoly Ryavkin on 21/05/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end


static NSString*loginControl = @"loginControl";
static NSString*passwordControl = @"passwordControl";
static NSString*sliderSpeedControl = @"sliderSpeedControl";
static NSString*segmentLevelControl = @"segmentLevelControl";
static NSString*swithMusicControl = @"swithMusicControl";
static NSString*stepperMusicControl =  @"stepperMusicControl";
static NSString*valueMusicControl = @"valueMusicControl";
static NSString*firstLaunch = @"firstLaunch";
static NSString*nameColorLableValueMusic = @"nameColorLableValueMusic";
static NSString*textLableValueMusic = @"textLableValueMusic";

@implementation TableViewController

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.tag==1){
        [self.psswordControl becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginControl.delegate=self;
    self.psswordControl.delegate=self;

    NSUserDefaults*userDefault = [NSUserDefaults standardUserDefaults];

    //[userDefault setInteger:0 forKey:firstLaunch];

    if([userDefault integerForKey:firstLaunch]==0){
        CGFloat red;
        CGFloat green;
        CGFloat blue;
        CGFloat alpha;
        NSArray*array;
        if([self.valueMusicLabel.backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha]){
            array=[NSArray arrayWithObjects:[NSNumber numberWithFloat:red], [NSNumber numberWithFloat:green],[NSNumber numberWithFloat:blue],[NSNumber numberWithFloat:alpha], nil];
        }
        [userDefault setObject:array forKey:nameColorLableValueMusic];
        [userDefault setInteger:1 forKey:firstLaunch];
    }else{
        [self loadFromUserDefault];
    }
    [self chekColor];
    [self saveUserDefauit];
}

-(void)chekColor{
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    if(self.swithMusicControl.isOn){
        self.stepperMusicControl.enabled=YES;
        CGFloat red,green,blue;
        NSArray*array=[NSArray arrayWithArray:[userDefault objectForKey:nameColorLableValueMusic]];
        red=[[array objectAtIndex:0] floatValue];
        green=[[array objectAtIndex:1] floatValue];
        blue=[[array objectAtIndex:2] floatValue];
        self.valueMusicLabel.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    }else{
        self.stepperMusicControl.enabled=NO;
        CGFloat red,green,blue;
        NSArray*array=[NSArray arrayWithArray:[userDefault objectForKey:nameColorLableValueMusic]];
        red=[[array objectAtIndex:0] floatValue];
        green=[[array objectAtIndex:1] floatValue];
        blue=[[array objectAtIndex:2] floatValue];
        self.valueMusicLabel.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:0.8];
    }
}

-(void)saveUserDefauit{
    NSUserDefaults*userDefault=[NSUserDefaults standardUserDefaults];

    [userDefault setObject:self.loginControl.text forKey:loginControl];
    [userDefault setObject:self.psswordControl.text forKey:passwordControl];
    [userDefault setFloat:self.sliderSpeedControl.value forKey:sliderSpeedControl];
    [userDefault setInteger:self.segmentLevelControl.selectedSegmentIndex forKey:segmentLevelControl];
    [userDefault setBool:self.swithMusicControl.on forKey:swithMusicControl];
    [userDefault setDouble:self.stepperMusicControl.value forKey:stepperMusicControl];
    [userDefault setObject:self.valueMusicLabel.text forKey:textLableValueMusic];

    [userDefault synchronize];

}

-(void)loadFromUserDefault{

    NSUserDefaults*userDefault=[NSUserDefaults standardUserDefaults];

    self.loginControl.text = [userDefault objectForKey:loginControl];
    self.psswordControl.text = [userDefault objectForKey:passwordControl];
    self.sliderSpeedControl.value = [userDefault floatForKey:sliderSpeedControl];
    self.segmentLevelControl.selectedSegmentIndex=[userDefault integerForKey:segmentLevelControl];
    self.swithMusicControl.on = [userDefault boolForKey:swithMusicControl];
    self.stepperMusicControl.value = [userDefault doubleForKey:stepperMusicControl];
    self.valueMusicLabel.text=[userDefault objectForKey:textLableValueMusic];
    [self chekColor];

}

- (IBAction)stepperMusicAction:(UIStepper *)sender {
    self.valueMusicLabel.text=[NSString stringWithFormat:@"%d",(int) self.stepperMusicControl.value];
    [self saveUserDefauit];
}

- (IBAction)swithMusicAction:(UISwitch *)sender {
    [self chekColor];
    [self saveUserDefauit];
    
}

- (IBAction)sliderSpeedAction:(UISlider *)sender {
     [self saveUserDefauit];
}


- (IBAction)segmentLevelAction:(UISegmentedControl *)sender {
     [self saveUserDefauit];
}

- (IBAction)passwordAction:(UITextField *)sender {
     [self saveUserDefauit];
}

- (IBAction)loginAction:(UITextField *)sender {
     [self saveUserDefauit];
}

- (IBAction)buttonSaveAction:(UIButton *)sender {
     [self saveUserDefauit];

}

- (IBAction)buttonResetAction:(UIButton *)sender {
    NSUserDefaults*userDefault=[NSUserDefaults standardUserDefaults];
    [userDefault setObject:@"" forKey:loginControl];
    [userDefault setObject:@"" forKey:passwordControl];
    [userDefault setFloat:0.5 forKey:sliderSpeedControl];
    [userDefault setInteger:2 forKey:segmentLevelControl];
    [userDefault setInteger:1 forKey:segmentLevelControl];
    [userDefault setBool:YES forKey:swithMusicControl];
    [userDefault setDouble:10 forKey:stepperMusicControl];

    [userDefault synchronize];

    self.loginControl.text = [userDefault objectForKey:loginControl];
    self.psswordControl.text = [userDefault objectForKey:passwordControl];
    self.sliderSpeedControl.value = [userDefault floatForKey:sliderSpeedControl];
    self.segmentLevelControl.selectedSegmentIndex=[userDefault integerForKey:segmentLevelControl];
    self.swithMusicControl.on = [userDefault boolForKey:swithMusicControl];
    self.stepperMusicControl.value = [userDefault doubleForKey:stepperMusicControl];
    self.valueMusicLabel.text=[NSString stringWithFormat:@"%d",(int) self.stepperMusicControl.value];

    [self chekColor];


}
@end
