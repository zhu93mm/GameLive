//
//  NSObject+MJEXtension.h
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

@interface NSObject (MJEXtension)
+ (id)parse:(id)responseObj;
+ (NSDictionary *)objClassInArray;
//mj_replacedKeyFromPropertyName121:和replaceKeyFromPropertyName方法有冲突, 使用了前者,则后者失效. 选择只使用前者来做key和属性名对应操作.
+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName;

//+ (NSDictionary *)replacedKeyFromPropertyName;
@end
