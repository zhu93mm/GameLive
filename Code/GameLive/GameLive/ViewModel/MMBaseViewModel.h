//
//  MMBaseViewModel.h
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+ViewModel.h"
#import "MMLiveNetManager.h"

@interface MMBaseViewModel : NSObject

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;

@end
