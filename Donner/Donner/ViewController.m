//
//  ViewController.m
//  Donner
//
//  Created by Michael Lee on 2015-01-26.
//  Copyright (c) 2015 leeemichael. All rights reserved.
//

#import "ViewController.h"
#import "RunScreenViewController.h"
#import "UIButton+buttonPressed.h"
#import <Fabric/Fabric.h>
#import <TwitterKit/TwitterKit.h>
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()
{
    BOOL timerStart;
    NSString *timeLeft;
    NSString *distanceLeft;
//    int tally;
//    NSInteger minutesLeft;
    NSDate *currentDate;
    BOOL pressedOnce;
//    BOOL timeUp;
}
@end

@implementation ViewController
@synthesize userDefaults;
- (void)viewDidLoad {
    [super viewDidLoad];
    PFUser *user = [PFUser user];
    user.username = @"my name";
    user.password = @"my pass";
    user.email = @"email@example.com";
    
    // other fields can be set if you want to save more information
    user[@"phone"] = @"650-555-0000";
    
    
    self.kmGoal.delegate = self;
    self.minutesGoal.delegate = self;
    UITapGestureRecognizer *userTap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(singleTap:)];
    [self.view addGestureRecognizer:userTap];
    
    _startButton.enabled = NO;
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
    userDefaults = [NSUserDefaults standardUserDefaults];
    if([[userDefaults objectForKey:@"Unit"] isEqualToString:@"Mi"]){
        _unit.selectedSegmentIndex = 0;
    }else{//includes default starting position
        NSLog(@"starting posn");
        _unit.selectedSegmentIndex = 1;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)singleTap:(UITapGestureRecognizer *)recognizer
{
    NSLog(@"user tapped");
    [_kmGoal endEditing:YES];
    [_minutesGoal endEditing:YES];
}

-(IBAction)wantTwitterShame:(id)sender
{
    NSLog(@"User wants twitter shame!");
}

-(IBAction)startPressed:(id)sender
{
    NSLog(@"START BUTTON PRESSED");
    RunScreenViewController *runViewController = [[RunScreenViewController alloc] init];
    NSLog(@"RunScreenViewController delegated");
    timerStart = true;
    //distanceLeft = _kmGoal.text;
    self.startTime = [NSDate date];
   // timeLeft = _minutesGoal.text;
   // minutesLeft = [timeLeft intValue];
    //The VC when user presses "Start" button (what they see while running)
    runViewController.runTimeLeft = timeLeft;
    runViewController.runDistanceLeft = distanceLeft;
    
    [self.navigationController pushViewController:runViewController animated:YES];
    NSLog(@"end of startPressed");
   /* _workLeft.text = distanceLeft;
    _workLeft.text = [_workLeft.text stringByAppendingString:@"km left in "];
    _workLeft.text = [_workLeft.text stringByAppendingString:timeLeft];
    _workLeft.text = [_workLeft.text stringByAppendingString:@" minutes!"];*/
    //[self initiateTimer];
//    [self updateTimer];
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

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"user ends editing uitextfield");
    if(![_kmGoal.text isEqualToString:@""] && ![_minutesGoal.text isEqualToString:@""]){
        _startButton.backgroundColor = [UIColor colorWithRed:0.204 green:0.702 blue:0 alpha:1];
        _startButton.enabled = YES;
    }else{
        _startButton.backgroundColor = [UIColor colorWithRed:0.635 green:0.635 blue:0.635 alpha:1];
        _startButton.enabled = NO;
    }
}

//passing values to runScreenViewController once start button is pressed
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"sendToRunViewController"]){
        timeLeft = _minutesGoal.text;
        distanceLeft = _kmGoal.text;
        RunScreenViewController *runViewController = [[RunScreenViewController alloc]init];
        runViewController = (RunScreenViewController *)segue.destinationViewController;
        NSLog(@"makes it here");
//        runViewController.timeLeft.text = timeLeft;
//        runViewController.distanceLeft.text = distanceLeft;
        runViewController.runTimeLeft = timeLeft;
        runViewController.runDistanceLeft = distanceLeft;
        if(_unit.selectedSegmentIndex == 0){
            [userDefaults setObject:@"Mi" forKey:@"Unit"];
            runViewController.distanceUnit = @" Mi";
        }else if(_unit.selectedSegmentIndex == 1){
            [userDefaults setObject:@"Km" forKey:@"Unit"];
            runViewController.distanceUnit = @" Km";
        }
        NSLog(@"Time left is: %@ and distance left is: %@", timeLeft, distanceLeft);
    }
}

-(void)RunScreenViewController:(RunScreenViewController *)viewController{
    NSLog(@"YEA!!");
}

@end