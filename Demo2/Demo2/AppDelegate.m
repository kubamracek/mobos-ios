//
//  AppDelegate.m
//  Demo2
//
//  Created by Kuba on 19.11.13.
//  Copyright (c) 2013 Kuba. All rights reserved.
//

#import "AppDelegate.h"
#import "MyViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [MyViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
