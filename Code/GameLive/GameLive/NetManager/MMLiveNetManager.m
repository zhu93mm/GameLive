//
//  MMLiveNetManager.m
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMLiveNetManager.h"

@implementation MMLiveNetManager
+ (id)getGameData:(id)requestType parameters:(NSDictionary *)parameters completionHandler:(void (^)(MMLiveListModel *, NSError *))completionHandler{
    return [self GET:@"http://www.quanmin.tv/json/play/list.json" parameters:parameters progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([MMLiveListModel parseJSON:jsonObject], error);
    }];
}

+ (id)getCategories:(id)requestType parameters:(NSDictionary *)parameters completionHandler:(void (^)(id , NSError *))completionHandler{
    return [self GET:requestType parameters:parameters progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([MMCategoriesModel parseJSON:jsonObject], error);
    }];
}

+ (id)getRoomListWithPage:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *pageStr = [NSString stringWithFormat:@"_%ld", page];
    if (page == 0) {
        pageStr = @"";
    }
    NSString *path = [NSString stringWithFormat:kRoomsPath, pageStr];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([MMLiveListModel parseJSON:jsonObject], error);
    }];
}

+ (id)getCategory:(NSString *)slug page:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *pageStr = [NSString stringWithFormat:@"_%ld", page];
    if (page == 0) {
        pageStr = @"";
    }
    NSString *path = [NSString stringWithFormat:kCategoryRoomsPath, slug, pageStr];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([MMCategoryModel parseJSON:jsonObject], error);
    }];
}

+ (id)getIntroCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:kIntroPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([MMIntroModel parse:jsonObject], error);
    }];
}

//搜索
+ (id)search:(NSString *)words page:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler{
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setObject:@"site.search" forKey:@"m"];
    [params setObject:@"2" forKey:@"os"];
    [params setObject:@"0" forKey:@"p[categoryId]"];
    [params setObject:words forKey:@"p[key]"];
    [params setObject:@(page) forKey:@"p[page]"];
    [params setObject:@"10" forKey:@"p[size]"];
    [params setObject:@"1.3.2" forKey:@"v"];
    return [self POST:kSearchPath parameters:params progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler([MMSearchModel parse:jsonObject], error);
    }];
}

@end
