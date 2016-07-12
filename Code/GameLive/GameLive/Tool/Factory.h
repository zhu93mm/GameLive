//
//  Factory.h
//  GameLive
//
//  Created by minmin on 16/7/6.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
+ (void)addBackItemToVC:(UIViewController *)vc;
+ (NSString *)md5:(NSString *)str;

+ (void)playVideo:(NSURL *)videoURL;

//右上角添加搜索按钮
+ (void)addSearchItemToVC:(UIViewController *)vc clickHandler:(void(^)())clickHandler;

+ (BOOL)isPhoneNumber:(NSString *)phoneNum;

@end
