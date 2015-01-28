//
//  ViewController.m
//  Donner
//
//  Created by Michael Lee on 2015-01-26.
//  Copyright (c) 2015 leeemichael. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL timerStart;
    NSString *timeLeft;
    NSString *distanceLeft;
    int tally;
    NSInteger minutesLeft;
    NSDate *currentDate;
    BOOL pressedOnce;
}

@property (nonatomic, strong) NSDate *startTime;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_FBShame setTintColor:[UIColor colorWithRed:218.0f/255.0f
                                           green:73.0f/255.0f
                                            blue:54.0f/255.0f
                                           alpha:1.0f]];
    [_FBShame setBackgroundColor:[UIColor colorWithRed:218.0f/255.0f
                                                 green:73.0f/255.0f
                                                  blue:54.0f/255.0f
                                                 alpha:1.0f]];
    _FBShame.layer.cornerRadius = 16.0;
    [_LinkedInShame setTintColor:[UIColor colorWithRed:218.0f/255.0f
                                           green:73.0f/255.0f
                                            blue:54.0f/255.0f
                                           alpha:1.0f]];
    [_LinkedInShame setBackgroundColor:[UIColor colorWithRed:218.0f/255.0f
                                                 green:73.0f/255.0f
                                                  blue:54.0f/255.0f
                                                 alpha:1.0f]];
    _LinkedInShame.layer.cornerRadius = 16.0;
    [_Donate setTintColor:[UIColor colorWithRed:218.0f/255.0f
                                           green:73.0f/255.0f
                                            blue:54.0f/255.0f
                                           alpha:1.0f]];
    [_Donate setBackgroundColor:[UIColor colorWithRed:218.0f/255.0f
                                                 green:73.0f/255.0f
                                                  blue:54.0f/255.0f
                                                 alpha:1.0f]];
    _Donate.layer.cornerRadius = 16.0;
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
        timeLeft = [NSString stringWithFormat:@"%d",minutesLeft];
        pressedOnce = true;
    }
}

-(void) updateLabel{
    //update distanceLeft;
    timeLeft = [NSString stringWithFormat:@"%d", minutesLeft];
    _workLeft.text = distanceLeft;
    _workLeft.text = [_workLeft.text stringByAppendingString:@"km left in "];
    _workLeft.text = [_workLeft.text stringByAppendingString:timeLeft];
    _workLeft.text = [_workLeft.text stringByAppendingString:@" minutes!"];
}

-(void)testTimer{
    NSLog(@"HERE");
    tally = tally + 1;
    if(tally == 12){
        tally = 0;
        minutesLeft = minutesLeft - 1;
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

-(IBAction)startPressed:(id)sender
{
    NSLog(@"START BUTTON PRESSED");
    timerStart = true;
    distanceLeft = _kmGoal.text;
    self.startTime = [NSDate date];
    timeLeft = _minutesGoal.text;
    minutesLeft = [timeLeft intValue];
    _workLeft.text = distanceLeft;
    _workLeft.text = [_workLeft.text stringByAppendingString:@"km left in "];
    _workLeft.text = [_workLeft.text stringByAppendingString:timeLeft];
    _workLeft.text = [_workLeft.text stringByAppendingString:@" minutes!"];
    [self initiateTimer];
    [self updateTimer];
}

@end
