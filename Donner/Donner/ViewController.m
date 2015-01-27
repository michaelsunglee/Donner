//
//  ViewController.m
//  Donner
//
//  Created by Michael Lee on 2015-01-26.
//  Copyright (c) 2015 leeemichael. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_FBShame setTintColor:[UIColor colorWithRed:218.0f/255.0f
                                           green:73.0f/255.0f
                                            blue:54.0f/255.0f
                                           alpha:1.0f]];
    [_LinkedInShame setTintColor:[UIColor colorWithRed:218.0f/255.0f
                                           green:73.0f/255.0f
                                            blue:54.0f/255.0f
                                           alpha:1.0f]];
    [_Donate setTintColor:[UIColor colorWithRed:218.0f/255.0f
                                           green:73.0f/255.0f
                                            blue:54.0f/255.0f
                                           alpha:1.0f]];
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

-(IBAction)startPressed:(id)sender
{
    NSLog(@"START BUTTON PRESSED");
    _workLeft.text = _kmGoal.text;
}

@end
