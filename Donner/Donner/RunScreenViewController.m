//
//  RunScreenViewController.m
//  Donner
//
//  Created by Michael Lee on 2015-05-07.
//  Copyright (c) 2015. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "RunScreenViewController.h"

@interface RunScreenViewController()
{
    int tally;
    NSInteger minutesLeft;
    BOOL timeUp;
    BOOL pressedOnce;
    BOOL timerStart;
}

@end

@implementation RunScreenViewController
-(void)viewDidLoad{
    NSLog(@"newViewController loads");
  //  ViewController *viewController = [[ViewController alloc] init];
//    _runTimeLeft = ViewController.timeLeft.text;
    NSLog(@"timeLeft is: %@", _runTimeLeft);
    NSLog(@"distanceLeft is: %@", _runDistanceLeft);
    [self updateRunLabel];
}

-(void)viewDidAppear{
    NSLog(@"runViewController appears");
}


-(void)updateRunLabel{
    NSLog(@"updateRunLabel called");
    _timeLeft.text = _runTimeLeft;
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

-(void) initiateTimer{
    if(timerStart == true && pressedOnce == false){
        _timeLeft.text = [NSString stringWithFormat:@"%ld", (long)minutesLeft];
        pressedOnce = true;
    }
}

-(void) updateLabel{
    //update distanceLeft;
    _timeLeft.text = [NSString stringWithFormat:@"%ld", (long)minutesLeft];
    if(timeUp == true){
        //    _workLeft.text = @"TIME'S UP";
    }else{
        /*  _workLeft.text = distanceLeft;
         _workLeft.text = [_workLeft.text stringByAppendingString:@"km left in "];
         _workLeft.text = [_workLeft.text stringByAppendingString:timeLeft];
         _workLeft.text = [_workLeft.text stringByAppendingString:@" minutes!"];*/
    }
}


@end