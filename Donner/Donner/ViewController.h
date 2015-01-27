//
//  ViewController.h
//  Donner
//
//  Created by Michael Lee on 2015-01-26.
//  Copyright (c) 2015 leeemichael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (assign, nonatomic) IBOutlet UISwitch *FBShame;
@property (assign, nonatomic) IBOutlet UISwitch *LinkedInShame;
@property (assign, nonatomic) IBOutlet UISwitch *Donate;
@property (assign, nonatomic) IBOutlet UITextField *kmGoal;
@property (assign, nonatomic) IBOutlet UITextField *minutesGoal;
@property (assign, nonatomic) IBOutlet UILabel *workLeft;
@property (assign, nonatomic) IBOutlet UIButton *startButton;

@end

