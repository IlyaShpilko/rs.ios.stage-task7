//
//  AppDelegate.m
//  Task 7
//
//  Created by Ilya Shpilko on 7/2/21.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController *rootViewController = [[ViewController alloc] init];
    window.rootViewController = rootViewController;
    self.window = window;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
