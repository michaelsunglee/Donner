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
    float distanceToTravel;
    BOOL timeUp;
    BOOL pressedOnce;
    BOOL timerStart;
    BOOL travelled;
}

@end

@implementation RunScreenViewController
-(void)viewDidLoad{
    NSLog(@"runViewController loads");
    _timeLeft.text = _runTimeLeft;
    _distanceLeft.text = _runDistanceLeft;
    distanceToTravel = [_runDistanceLeft floatValue];

    NSLog(@"second: %@", _timeLeft.text);
    
    //convert nsstring to nsinteger to use timer
    _minutesLeft = [_runTimeLeft integerValue];
    [self addDistanceUnit];
    [self initiateTimer];
    [self updateTimer];
    [self updateRunLabel];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;//test and see if this is best accuracy setting
    if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
        [self.locationManager requestAlwaysAuthorization];
        NSLog(@"SHOULD BE CALLED");
        CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
        NSLog(@"status is: %d", status);
        if(status == kCLAuthorizationStatusAuthorizedAlways) {
            NSLog(@"Called when user accepts location services");
            [self.locationManager startUpdatingLocation];
        }
        
    }
    [self.locationManager startUpdatingLocation];
    //this view is always tracking location/distance travelled so set as delegate
    self.locationManager.delegate = self;
    self.location = [[CLLocation alloc] init];
    self.locationManager.distanceFilter = 10; //in meters
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {//need this bc will crash in ios7- otherwise
//        NSLog(@"SHOULD NEVER BE CALLED");
        [self.locationManager requestWhenInUseAuthorization];
    }
    
       travelled = false;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0){
        NSLog(@"button index 0");
    }else if(buttonIndex == 1){
        NSLog(@"button index 1");
    }
}

-(void)userFail{
    
}

-(void)userVictorious{
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
//    getting lastObject from locations NSArray and storing in CLLocation property (self.location)
    self.location = locations.lastObject;
    NSLog(@"%@", self.location.description);
    distanceToTravel -= 0.01;
    NSLog(@"distanceToTravel is: %f", distanceToTravel);
    if(distanceToTravel >= [_runDistanceLeft floatValue]-0.05){//to counteract when user first starts and method runs x number of times. x seems to be random
        return;
    }
    _distanceLeft.text = [NSString stringWithFormat:@"%.2f", distanceToTravel];
    _distanceLeft.text = [_distanceLeft.text stringByAppendingString:_distanceUnit];
    if(distanceToTravel <= 0){//less than put just in case
        [self.locationManager stopUpdatingLocation];//user successfully covers distance before time runs out
        [self userVictorious];
        return;
    }
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
    if(_totalSeconds <= 0){//time runs out
        _timeLeft.text = @"TIME UP";
        //trigger punishment here
        [self userFail];
        return;
    }
    --_totalSeconds;
    _minutesLeft = _totalSeconds / 60;
    _secondsLeft = _totalSeconds % 60;
    [self updateTimeLeft];
}

-(void)addDistanceUnit{
    _distanceLeft.text = [_distanceLeft.text stringByAppendingString:_distanceUnit];
}

//if user denies access to use location
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", error.description);
}

@end