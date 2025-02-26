//
//  AppDelegate.m
//  OAAppDelegateExample
//
//  Created by echo on 2/20/25.
//

#import "AppDelegate.h"
@import Marketing;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[MarketingObjC shared] logWithMessage:@"didFinishLaunching"];
    
    return YES;
}

// AppDelegate scheme entry point
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    [[MarketingObjC shared] logWithMessage:@"openURLContexts"];
    
    return YES;
}

// AppDelegate Universal Link entry point
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    
    [[MarketingObjC shared] logWithMessage:@"continueUserActivity"];
    
    return YES;
}

@end
