//
//  AppDelegate.m
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "AppDelegate.h"
//#import "MMLiveNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    
    //用于测试解析是否成功
//    MMLiveNetManager *manager = [MMLiveNetManager getGameData:nil parameters:nil completionHandler:^(MMLiveListModel *model, NSError *error) {
//        NSLog(@"");
//    }];
    
    return YES;
}

@end
