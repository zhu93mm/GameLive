//
//  MMLiveListModel.m
//  TRProject
//
//  Created by minmin on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MMLiveListModel.h"

@implementation MMLiveListModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data": [MMLiveListDataModel class]};
}
@end

@implementation MMLiveListRecommendModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data": [MMLiveListRecommendDataModel class]};
}
@end


@implementation MMLiveListDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


@implementation MMLiveListDataLinkObjectModel

@end


@implementation MMLiveListRecommendDataModel

@end
