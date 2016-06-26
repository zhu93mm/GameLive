//
//  NSObject+AFNetWorking.m
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "NSObject+AFNetWorking.h"

#define kTimeOutInterval      30

@implementation NSObject (AFNetWorking)

+ (id)GET:(NSString *)path parameters:(id)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id, NSError *))completionHandler{
    /*
     if (!kAppDelegate.isOnLine) {
     [kAppDelegate.window showWarning:@"当前离线状态!"];
     NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{}];
     !completionHandler ?: completionHandler(nil, error);
     return nil;
     }
     */
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:kBasePath.mm_URL];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json"]];
    manager.requestSerializer.timeoutInterval = kTimeOutInterval;
    return [manager GET:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil, error);
        DDLogError(@"error %@", error);
    }];
}

+ (id)POST:(NSString *)path parameters:(id)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id, NSError *))completionHandler{
    if (!kAppDelegate.isOnLine) {
        [kAppDelegate.window showWarning:@"当前离线状态!"];
        NSError *error = [NSError errorWithDomain:@"" code:999 userInfo:@{}];
        !completionHandler ?: completionHandler(nil, error);
        return nil;
    }
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:kBasePath.mm_URL];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json"]];
    manager.requestSerializer.timeoutInterval = kTimeOutInterval;
    return [manager POST:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil, error);
        DDLogError(@"error %@", error);
    }];
}

@end
