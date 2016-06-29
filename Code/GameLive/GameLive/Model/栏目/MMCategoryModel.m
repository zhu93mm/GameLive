//
//  MMCategoryModel.m
//  GameLive
//
//  Created by minmin on 16/6/28.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMCategoryModel.h"

@implementation MMCategoryModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data": [MMCategoryDataModel class]};
}
@end


@implementation MMCategoryDataModel

@end

