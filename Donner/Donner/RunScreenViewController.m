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
    BOOL timeUp;
    BOOL pressedOnce;
    BOOL timerStart;
}

@end

@implementation RunScreenViewController
-(void)viewDidLoad{
    NSLog(@"runViewController loads");
    _timeLeft.text = _runTimeLeft;
    _distanceLeft.text = _runDistanceLeft;

    NSLog(@"second: %@", _timeLeft.text);
    //may want to re-format below line. 13:12 style
    [self addUnits];
    
    //convert nsstring to nsinteger to use timer
    _minutesLeft = [_runTimeLeft integerValue];
    
    //[self initiateTimer];
    [self updateTimer];
    [self updateRunLabel];
}

-(void) initiateTimer{
    //if(timerStart == true && pressedOnce == false){
    NSLog(@"minutesLeft is: %zd", _minutesLeft);
    _timeLeft.text = [NSString stringWithFormat:@"%ld", (long)_minutesLeft];
    //pressedOnce = true;
    //}
}

-(void)updateRunLabel{
    NSLog(@"updateRunLabel called");
    _timeLeft.text = [NSString stringWithFormat:@"%ld", (long)_minutesLeft];
    _distanceLeft.text = _runDistanceLeft;
    [self addUnits];
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
        _minutesLeft = _minutesLeft - 1;
        if(_minutesLeft == 0){
            timeUp = true;
        }
        [self updateRunLabel];
    }
}

-(void) updateLabel{
    //update distanceLeft;
   // _timeLeft.text = [NSString stringWithFormat:@"%ld", (long)minutesLeft];
    if(timeUp == true){
        //    _workLeft.text = @"TIME'S UP";
    }else{
        /*  _workLeft.text = distanceLeft;
         _workLeft.text = [_workLeft.text stringByAppendingString:@"km left in "];
         _workLeft.text = [_workLeft.text stringByAppendingString:timeLeft];
         _workLeft.text = [_workLeft.text stringByAppendingString:@" minutes!"];*/
    }
}

-(void)addUnits{
    _timeLeft.text = [_timeLeft.text stringByAppendingString:@ " Min"];
    _distanceLeft.text = [_distanceLeft.text stringByAppendingString:_distanceUnit];
}


@end