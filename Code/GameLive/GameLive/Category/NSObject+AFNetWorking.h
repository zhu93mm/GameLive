//
//  NSObject+AFNetWorking.h
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface NSObject (AFNetWorking)

+ (id)GET:(NSString *)path parameters:(id)parameters progress:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:(void(^)(id jsonObject, NSError *error))completionHandler;

+ (id)POST:(NSString *)path parameters:(id)parameters progress:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:(void(^)(id jsonObject, NSError *error))completionHandler;

@end
