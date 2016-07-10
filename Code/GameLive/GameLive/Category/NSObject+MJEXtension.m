//
//  NSObject+MJEXtension.m
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "NSObject+MJEXtension.h"

@implementation NSObject (MJEXtension)

+ (id)parse:(id)responseObj{
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:responseObj];
    }
    return responseObj;
}

+ (NSDictionary *)mj_objectClassInArray{
    return [self objClassInArray];
}

+ (NSDictionary *)objClassInArray{
    return nil;
}

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [self replacedKeyFromPropertyName:propertyName];
}

+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName{
    return propertyName;
}

@end
