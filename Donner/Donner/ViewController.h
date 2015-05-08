//
//  ViewController.h
//  Donner
//
//  Created by Michael Lee on 2015-01-26.
//  Copyright (c) 2015 leeemichael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController

@property (assign, nonatomic) IBOutlet UITextField *kmGoal;
@property (assign, nonatomic) IBOutlet UITextField *minutesGoal;
@property (assign, nonatomic) IBOutlet UIButton *startButton;
@property (assign, nonatomic) IBOutlet UIButton *twitterButton;
@property (assign, nonatomic) IBOutlet UIButton *facebookButton;
@property (assign, nonatomic) IBOutlet UIButton *linkedInButton;

@property (assign, nonatomic) NSTimer *timer;

@end

