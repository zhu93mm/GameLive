//
//  AppDelegate.m
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "AppDelegate.h"
#import "MMCategoriesViewController.h"
//#import "MMLiveNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    
    //用于测试解析是否成功
//    MMLiveNetManager *manager = [MMLiveNetManager getCategories:kcategoriesPath parameters:nil completionHandler:^(id model, NSError *error) {
//        NSLog(@"");
//    }];
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    _window.rootViewController = self.tabC;

    return YES;
}

- (UITabBarController *)tabC {
    if(_tabC == nil) {
        _tabC = [[UITabBarController alloc] init];
        MMCategoriesViewController *cateVC = [[MMCategoriesViewController alloc] init];
        UINavigationController *cateNavi = [[UINavigationController alloc] initWithRootViewController:cateVC];
        _tabC.viewControllers = @[cateNavi];
    }
    return _tabC;
}

@end
