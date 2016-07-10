//
//  MMBaseModel.m
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMBaseModel.h"

@implementation MMBaseModel
MJCodingImplementation

+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName{
    //进行一些统一的变化
    if ([propertyName isEqualToString:@"ID"]) propertyName = @"id";
    if ([propertyName isEqualToString:@"desc"]) propertyName = @"description";
    return [propertyName mj_underlineFromCamel];
}

@end
