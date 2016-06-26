//
//  MMBaseViewModel.h
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VMRequestMode) {
    VMRequestModeRefresh,
    VMRequestModeMore,
};

@interface MMBaseViewModel : NSObject{
    NSURLSessionDataTask *_dataTask;
}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;
@property (nonatomic) NSURLSessionDataTask *dataTask;

@end
