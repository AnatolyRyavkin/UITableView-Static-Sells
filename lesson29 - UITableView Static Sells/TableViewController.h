//
//  TableViewController.h
//  lesson29 - UITableView Static Sells
//
//  Created by Anatoly Ryavkin on 21/05/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableViev;

@property (weak, nonatomic) IBOutlet UITextField *loginControl;
@property (weak, nonatomic) IBOutlet UITextField *psswordControl;
@property (weak, nonatomic) IBOutlet UISlider *sliderSpeedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentLevelControl;
@property (weak, nonatomic) IBOutlet UISwitch *swithMusicControl;
@property (weak, nonatomic) IBOutlet UIStepper *stepperMusicControl;
@property (weak, nonatomic) IBOutlet UILabel *valueMusicLabel;

@property UIColor* colorButtonValueMusic;
@property NSInteger firstLoad;

- (IBAction)stepperMusicAction:(UIStepper *)sender;
- (IBAction)swithMusicAction:(UISwitch *)sender;
- (IBAction)sliderSpeedAction:(UISlider *)sender;
- (IBAction)segmentLevelAction:(UISegmentedControl *)sender;
- (IBAction)passwordAction:(UITextField *)sender;
- (IBAction)loginAction:(UITextField *)sender;
- (IBAction)buttonSaveAction:(UIButton *)sender;
- (IBAction)buttonResetAction:(UIButton *)sender;


-(void)saveUserDefauit;
-(void)loadFromUserDefault;
-(void)chekColor;





@end

NS_ASSUME_NONNULL_END
