//
//  RunScreenViewController.h
//  Donner
//
//  Created by Michael Lee on 2015-05-07.
//  Copyright (c) 2015 leeemichael. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RunScreenViewController : UIViewController

@property (nonatomic) NSString* runTimeLeft;
@property (nonatomic) NSString* runDistanceLeft;
@property (nonatomic, strong) NSString* distanceUnit;
@property (nonatomic, strong) IBOutlet UILabel *timeLeft;
@property (nonatomic, strong) IBOutlet UILabel *distanceLeft;
@property (nonatomic) NSInteger minutesLeft;
@end