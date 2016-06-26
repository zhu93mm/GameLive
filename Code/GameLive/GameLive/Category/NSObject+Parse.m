//
//  NSObject+Parse.m
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)

+ (id)parseJSON:(id)json{
    if([json isKindOfClass:[NSDictionary class]]){
        return [self modelWithJSON:json];
    }
    if ([json isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:json];
    }
    return json;
}

@end
