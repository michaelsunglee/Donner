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
    
    //convert nsstring to nsinteger to use timer
    _minutesLeft = [_runTimeLeft integerValue];
    [self addDistanceUnit];
    [self initiateTimer];
    [self updateTimer];
    [self updateRunLabel];
}

-(void) initiateTimer{
    _totalSeconds = _minutesLeft * 60;
    _secondsLeft = _totalSeconds % 60;//should always start at 0
    [self updateTimeLeft];
}

-(void)updateTimeLeft{//called every second
    //turning minutes chosen into mm:ss format
    _timeLeft.text = [NSString stringWithFormat:@"%ld", (long)_minutesLeft];
    _timeLeft.text = [_timeLeft.text stringByAppendingString:@":"];
    if(_secondsLeft <10 && _secondsLeft >= 0){//mm:ss intead of mm:s when s is one digit
        _timeLeft.text = [_timeLeft.text stringByAppendingString:@"0"];
    }
    _timeLeft.text = [_timeLeft.text stringByAppendingString: [NSString stringWithFormat:@"%ld", (long)_secondsLeft]];
}

-(void)updateRunLabel{
   /* _timeLeft.text = [NSString stringWithFormat:@"%ld", (long)_minutesLeft];
    _timeLeft.text = [_timeLeft.text stringByAppendingString:@":"];
    _timeLeft.text = [_timeLeft.text stringByAppendingString: [NSString stringWithFormat:@"%ld", (long)_secondsLeft]];
    _distanceLeft.text = _runDistanceLeft;*/
//    [self updateTimeLeft];
}

-(void) updateTimer{
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target: self
                                   selector:@selector(timerFire)
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

-(void)timerFire{//called every second
    --_totalSeconds;
    _minutesLeft = _totalSeconds / 60;
    _secondsLeft = _totalSeconds % 60;
    [self updateTimeLeft];
}

-(void)addDistanceUnit{
    _distanceLeft.text = [_distanceLeft.text stringByAppendingString:_distanceUnit];
}

@end