//
//  MMIntroModel.m
//  GameLive
//
//  Created by minmin on 16/7/8.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMIntroModel.h"

@implementation MMIntroModel
+ (NSDictionary *)objectClassInArray{
    return @{@"moblieWebgame":[MMIntroMobileLinkModel class],
             @"moblieMinecraft":[MMIntroMobileLinkModel class],
             @"mobileTvgame":[MMIntroMobileLinkModel class],
             @"moblieSport":[MMIntroMobileLinkModel class],
             @"mobileStar":[MMIntroMobileModel class],
             @"mobileRecommendation":[MMIntroMobileModel class],
             @"mobileLol":[MMIntroMobileLinkModel class],
             @"mobileHeartstone":[MMIntroMobileLinkModel class],
             @"moblieBlizzard":[MMIntroMobileLinkModel class],
             @"mobileBeauty":[MMIntroMobileLinkModel class],
             @"mobileIndex":[MMIntroMobileModel class],
             @"mobileDota2":[MMIntroMobileLinkModel class],
             @"moblieDnf":[MMIntroMobileLinkModel class],
             @"list":[MMIntroListModel class],};
}
+ (NSString *)replacedKeyFromPropertyName:(NSString *)propertyName{
    propertyName = [super replacedKeyFromPropertyName:propertyName];
    return [propertyName stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
}

@end

@implementation MMIntroMobileLinkModel

@end


@implementation MMIntroLinkModel

@end


@implementation MMIntroMobileModel

@end


@implementation MMIntroListModel

@end
