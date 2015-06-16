//
//  ViewController.h
//  Donner
//
//  Created by Michael Lee on 2015-01-26.
//  Copyright (c) 2015 leeemichael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "RunScreenViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *kmGoal;
@property (nonatomic, strong) IBOutlet UITextField *minutesGoal;
@property (nonatomic, strong) IBOutlet UIButton *startButton;
@property (nonatomic, strong) IBOutlet UIButton *twitterButton;
@property (nonatomic, strong) IBOutlet UIButton *facebookButton;
@property (nonatomic, strong) IBOutlet UIButton *linkedInButton;
@property (nonatomic, strong) IBOutlet UISegmentedControl *unit;
@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, readonly, retain) UIImage *currentBackgroundImage;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end