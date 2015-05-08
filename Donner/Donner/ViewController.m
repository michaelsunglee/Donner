//
//  ViewController.m
//  Donner
//
//  Created by Michael Lee on 2015-01-26.
//  Copyright (c) 2015 leeemichael. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+buttonPressed.h"
#import <Fabric/Fabric.h>
#import <TwitterKit/TwitterKit.h>
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()
{
    BOOL timerStart;
    NSString *timeLeft;
    NSString *distanceLeft;
    int tally;
    NSInteger minutesLeft;
    NSDate *currentDate;
    BOOL pressedOnce;
    BOOL timeUp;
}

@property (nonatomic, strong) NSDate *startTime;
@property (nonatomic, readonly, retain) UIImage *currentBackgroundImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PFUser *user = [PFUser user];
    user.username = @"my name";
    user.password = @"my pass";
    user.email = @"email@example.com";
    
    // other fields can be set if you want to save more information
    user[@"phone"] = @"650-555-0000";
   
    /*
     [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_kmGoal endEditing:YES];
    [_minutesGoal endEditing:YES];
}

-(void) initiateTimer{
    if(timerStart == true && pressedOnce == false){
        timeLeft = [NSString stringWithFormat:@"%ld", minutesLeft];
        pressedOnce = true;
    }
}

-(void) updateLabel{
    //update distanceLeft;
    timeLeft = [NSString stringWithFormat:@"%ld", minutesLeft];
    if(timeUp == true){
    //    _workLeft.text = @"TIME'S UP";
    } else{
      /*  _workLeft.text = distanceLeft;
        _workLeft.text = [_workLeft.text stringByAppendingString:@"km left in "];
        _workLeft.text = [_workLeft.text stringByAppendingString:timeLeft];
        _workLeft.text = [_workLeft.text stringByAppendingString:@" minutes!"];*/
    }
}

-(void)testTimer{
    NSLog(@"HERE");
    ++tally;
    if(tally == 12){
        tally = 0;
        minutesLeft = minutesLeft - 1;
        if(minutesLeft == 0){
            timeUp = true;
        }
        [self updateLabel];
    }
}

-(void) updateTimer{
    [NSTimer scheduledTimerWithTimeInterval:5.0f
                                     target: self
                                   selector:@selector(testTimer)
                                   userInfo:nil
                                    repeats:YES];
    
    //NSTimeInterval TimeInterval = [currentDate timeIntervalSinceDate:self.startTime];
    //NSDate *TimerDate = [NSDate dateWithTimeIntervalSince1970:TimeInterval];
    //Create date formatter
    //NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"mm:ss"];
    
    //Format the elapsed time and update label
   // NSString *TimeString = [dateFormatter stringFromDate:TimerDate];
    //minutesLeft= minutesLeft-1;
}

-(IBAction)wantTwitterShame:(id)sender
{
    NSLog(@"User wants twitter shame!");
}

-(IBAction)startPressed:(id)sender
{
    NSLog(@"START BUTTON PRESSED");
    timerStart = true;
    distanceLeft = _kmGoal.text;
    self.startTime = [NSDate date];
    timeLeft = _minutesGoal.text;
    minutesLeft = [timeLeft intValue];
   /* _workLeft.text = distanceLeft;
    _workLeft.text = [_workLeft.text stringByAppendingString:@"km left in "];
    _workLeft.text = [_workLeft.text stringByAppendingString:timeLeft];
    _workLeft.text = [_workLeft.text stringByAppendingString:@" minutes!"];*/
    [self initiateTimer];
    [self updateTimer];
}

-(IBAction)didPressTwitterButton:(id)sender{
    [_twitterButton didPressButton:_twitterButton];
}

-(IBAction)didPressFacebookButton:(id)sender{
    [_facebookButton didPressButton:_facebookButton];
}

-(IBAction)didPressLinkedInButton:(id)sender{
    [_linkedInButton didPressButton:_linkedInButton];
}

-(IBAction)unwindSegue:(UIStoryboardSegue *)segue{
    
}

@end