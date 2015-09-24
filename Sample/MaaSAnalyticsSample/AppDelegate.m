//
//  AppDelegate.m
//  MaaSAnalyticsSample
//
//  Created by Devin Pigera on 7/12/13.
//  Copyright (c) 2013 Phunware Inc. All rights reserved.
//

#import "AppDelegate.h"

#import "InfoViewController.h"
#import "EventViewController.h"
#import "ConsoleViewController.h"

#import "PWLogger.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Initialize MaaSCore with your credentials
    [PWCore setApplicationID:@"YOUR_APPLICATION_ID"
                     accessKey:@"YOUR_ACCESS_KEY"
                  signatureKey:@"YOUR_SIGNATURE_KEY"
                 encryptionKey:@""];
    
    // Setup our application
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0 green:182/255.0f blue:235/255.0f alpha:1]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    InfoViewController *info = [InfoViewController new];
    UITabBarItem *infoTab = [[UITabBarItem alloc] initWithTitle:@"Info" image:[UIImage imageNamed:@"info"] tag:0];
    info.tabBarItem = infoTab;
    
    EventViewController *event = [EventViewController new];
    UITabBarItem *eventTab = [[UITabBarItem alloc] initWithTitle:@"Events" image:[UIImage imageNamed:@"subscriptions"] tag:1];
    event.tabBarItem = eventTab;
    
    ConsoleViewController *console = [ConsoleViewController new];
    UITabBarItem *consoleTab = [[UITabBarItem alloc] initWithTitle:@"Console" image:[UIImage imageNamed:@"console"] tag:1];
    console.tabBarItem = consoleTab;
    
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    tabBar.viewControllers = @[info, event, console];
    
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
