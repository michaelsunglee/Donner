//
//  UIButton+buttonSelected.m
//  Donner
//
//  Created by Michael Lee on 2015-04-30.
//  Copyright (c) 2015 leeemichael. All rights reserved.
//

#import "UIButton+buttonPressed.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation UIButton (buttonSelected)

-(void)didPressButton:(UIButton*)button{
    if(button.selected == NO)
    {
        NSLog(@"BUTTON SELECTED");
        button.selected = YES;
        button.backgroundColor = UIColorFromRGB(0x3cbc00);
        
    }else if(button.selected == YES){
        NSLog(@"BUTTON NOT SELECTED");
        button.selected = NO;
        button.backgroundColor = UIColorFromRGB(0xa2a2a2);
    }
}

@end
