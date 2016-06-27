//
//  MMLiveNetManager.h
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMLiveListModel.h"
#import "MMCategoriesModel.h"

@interface MMLiveNetManager : NSObject
+ (id)getGameData:(id)requestType parameters:(NSDictionary *)parameters completionHandler:(void(^)(MMLiveListModel *model, NSError *error))completionHandler;

+ (id)getCategories:(id)requestType parameters:(NSDictionary *)parameters completionHandler:(void(^)(id model, NSError *error))completionHandler;
@end
