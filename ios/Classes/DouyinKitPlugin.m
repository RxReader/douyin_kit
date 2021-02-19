#import "DouyinKitPlugin.h"
#import <DouyinOpenSDK/DouyinOpenSDKApplicationDelegate.h>
#import <DouyinOpenSDK/DouyinOpenSDKAuth.h>

@implementation DouyinKitPlugin {
    FlutterMethodChannel *_channel;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel *channel =
        [FlutterMethodChannel methodChannelWithName:@"v7lin.github.io/douyin_kit"
                                    binaryMessenger:[registrar messenger]];
    DouyinKitPlugin *instance = [[DouyinKitPlugin alloc] initWithChannel:channel];
    [registrar addApplicationDelegate:instance];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (instancetype)initWithChannel:(FlutterMethodChannel *)channel {
    self = [super init];
    if (self) {
        _channel = channel;
    }
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall *)call
                  result:(FlutterResult)result {
    if ([@"registerApp" isEqualToString:call.method]) {
        NSString *clientKey = call.arguments[@"client_key"];
        [[DouyinOpenSDKApplicationDelegate sharedInstance] registerAppId:clientKey];
        result(nil);
    } else if ([@"isInstalled" isEqualToString:call.method]) {
        result([NSNumber numberWithBool:[[DouyinOpenSDKApplicationDelegate sharedInstance] isAppInstalled]]);
    } else if ([@"isSupportAuth" isEqualToString:call.method]) {
        result([NSNumber numberWithBool:YES]);
    } else if ([@"auth" isEqualToString:call.method]) {
        [self handleAuthCall:call result:result];
    } else if ([@"isSupportShare" isEqualToString:call.method]) {
        
    } else if ([@[@"shareImage", @"shareVideo", @"shareMicroApp", @"shareHashTags", @"shareAnchor"] containsObject:call.method]) {
        [self handleShareCall:call result:result];
    } else if ([@"isSupportShareToContacts" isEqualToString:call.method]) {
        
    } else if ([@[@"shareImageToContacts", @"shareHtmlToContacts"] containsObject:call.method]) {
        [self handleShareToContactsCall:call result:result];
    } else if ([@"isSupportOpenRecord" isEqualToString:call.method]) {
        
    } else if ([@"openRecord" isEqualToString:call.method]) {
        [self handleOpenRecordCall:call result:result];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)handleAuthCall:(FlutterMethodCall *)call result:(FlutterResult)result {
}

- (void)handleShareCall:(FlutterMethodCall *)call
                      result:(FlutterResult)result {
}

- (void)handleShareToContactsCall:(FlutterMethodCall *)call
                      result:(FlutterResult)result {
}

- (void)handleOpenRecordCall:(FlutterMethodCall *)call
                      result:(FlutterResult)result {
}

#pragma mark - AppDelegate

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [[DouyinOpenSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:nil annotation:nil];
}

- (BOOL)application:(UIApplication *)application
              openURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication
           annotation:(id)annotation {
    return [[DouyinOpenSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:
                (NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    return [[DouyinOpenSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey] annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
}

@end
