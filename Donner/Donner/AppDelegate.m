//
//  AppDelegate.m
//  Donner
//
//  Created by Michael Lee on 2015-01-26.
//  Copyright (c) 2015 leeemichael. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <TwitterKit/TwitterKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize dictionary;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"didFinishLaunchingWithOptions");
    [FBSession.activeSession closeAndClearTokenInformation];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [Fabric with:@[TwitterKit]];

    
    dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Keys" ofType:@"plist"]];
    
    return YES;
}

-(void)twitterAuth{
    //Trigger method for Twitter Auth
    NSLog(@"twitterAuth method called");
    NSString *FabricConsumerKey = [dictionary objectForKey:@"twitterConsumerKey"];
    NSString *FabricSecretKey = [dictionary objectForKey:@"twitterSecretKey"];
    [PFTwitterUtils initializeWithConsumerKey:FabricConsumerKey
                               consumerSecret:FabricSecretKey];
    
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
    if (!user) {
        NSLog(@"Uh oh. The user cancelled the Twitter login.");
        return;
    } else if (user.isNew) {
        NSLog(@"User signed up and logged in with Twitter!");
    } else {
        NSLog(@"User logged in with Twitter!");
    }
    }];
     
}

-(void)facebookAuth{

    NSLog(@"facebookAuth method called");
    NSString *ParseApplicationId = [dictionary objectForKey:@"parseApplicationId"];
    NSString *ParseClientKey = [dictionary objectForKey:@"parseClientKey"];
    //Starting Facebook Auth

    [Parse setApplicationId:ParseApplicationId
                  clientKey:ParseClientKey];
     [PFFacebookUtils initializeFacebook];
    
    
     //Trigger method for Facebook Auth
     NSArray *permissionsArray = @[@"user_about_me"];
    if([[FBSession activeSession] isOpen]){
        if([[[FBSession activeSession] permissions] indexOfObject:@"publish_actions"] == NSNotFound){
            [[FBSession activeSession] requestNewPublishPermissions:[NSArray arrayWithObject:@"publish_actions"] defaultAudience:FBSessionDefaultAudienceFriends completionHandler:^(FBSession *session, NSError *error) {
            }];
        }
    }else{
        [FBSession openActiveSessionWithPublishPermissions:[NSArray arrayWithObject:@"publish_actions"]
                                           defaultAudience:FBSessionDefaultAudienceOnlyMe
                                              allowLoginUI:YES
                                         completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
                                             if (!error && status == FBSessionStateOpen) {
                                                 NSLog(@"new user");
                                             }else{
                                                 NSLog(@"error2");
                                             }
                                         }];
    }
    //    PFUser *user = [PFUser user];
    //    user.username = @"my name";
    //    user.password = @"my pass";
    //    user.email = @"email@example.com";
    //
    //    // other fields can be set if you want to save more information
    //    user[@"phone"] = @"650-555-0000";
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
    
     [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
     if (!user) {
         NSLog(@"Uh oh. The user cancelled the Facebook login.");
     } else if (user.isNew) {
         NSLog(@"User signed up and logged in through Facebook!");
     } else {
         NSLog(@"User logged in through Facebook!");
     }
     }];
    NSLog(@"after1");
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

/*- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
 */

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
