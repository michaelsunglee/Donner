//
//  RunScreenViewController.h
//  Donner
//
//  Created by Michael Lee on 2015-05-07.
//  Copyright (c) 2015 leeemichael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface RunScreenViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic) NSString* runTimeLeft;
@property (nonatomic) NSString* runDistanceLeft;
@property (nonatomic, strong) NSString* distanceUnit;
@property (nonatomic, strong) IBOutlet UILabel *timeLeft;
@property (nonatomic, strong) IBOutlet UILabel *distanceLeft;
@property (nonatomic, strong) IBOutlet UIButton *quitButton;
@property (nonatomic) NSInteger minutesLeft;
@property (nonatomic) NSInteger secondsLeft;
@property (nonatomic) NSInteger totalSeconds;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;
@property (assign, nonatomic) CLLocationDistance distanceFilter;
@end