//
//  NSObject+ViewModel.h
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh,
    RequestModeMore,
};

@interface NSObject (ViewModel)

@property (nonatomic) NSURLSessionDataTask *dataTask;

@end
