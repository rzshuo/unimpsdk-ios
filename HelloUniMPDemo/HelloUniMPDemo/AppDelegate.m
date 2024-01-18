//
//  AppDelegate.m
//  HelloUniMPDemo
//
//  Created by dcloud on 2024/1/16.
//

#import "AppDelegate.h"
#import "DCUniMP.h"
#import "WeexSDK.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 配置参数
    NSMutableDictionary *options = [NSMutableDictionary dictionaryWithDictionary:launchOptions];
    // 设置 debug YES 会在控制台输出 js log，默认不输出 log，注：需要引入 liblibLog.a 库
    [options setObject:[NSNumber numberWithBool:YES] forKey:@"debug"];
    // 初始化引擎
    [DCUniMPSDKEngine initSDKEnvironmentWithLaunchOptions:options];
    
    // 注册 module 注：module的 Name 需要保证唯一， class：为 module 的类名
    [WXSDKEngine registerModule:@"TestModule" withClass:NSClassFromString(@"TestModule")];
    // 注册 component 注：component 的 Name 需要保证唯一， class：为 component 的类名
    [WXSDKEngine registerComponent:@"testmap" withClass:NSClassFromString(@"TestMapComponent")];
    
    return YES;
}

#pragma mark - 如需使用远程推送相关功能，请实现以下方法
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // 远程通知注册成功，收到 deviceToken 调用sdk方法，传入 deviceToken
    [DCUniMPSDKEngine application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    // 远程通知注册失败
    [DCUniMPSDKEngine application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // 收到远程推送消息
    [DCUniMPSDKEngine application:application didReceiveRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

#pragma mark - 如需使用本地推送通知功能，请实现以下方法
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    // 收到本地推送消息
    [DCUniMPSDKEngine application:application didReceiveLocalNotification:notification];
}


@end
