//
//  MMCategoryViewModel.m
//  GameLive
//
//  Created by minmin on 16/6/28.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMCategoryViewModel.h"

@implementation MMCategoryViewModel

- (instancetype)initWithSlug:(NSString *)slug{
    if (self = [super init]) {
        _slug = slug;
    }
    return self;
}

- (instancetype)init{
    NSAssert(NO, @"%s 比如使用initWithSlug:进行初始化", __FUNCTION__);
    return nil;
}

- (NSInteger)rowNumber{
    return self.roomlist.count;
}

- (MMCategoryDataModel *)modelForRow:(NSInteger)row{
    return self.roomlist[row];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].thumb];
}

- (NSString *)nickForRow:(NSInteger)row{
    return [self modelForRow:row].nick;
}

- (NSString *)viewForRow:(NSInteger)row{
    NSString *views = [self modelForRow:row].view;
    if (views.doubleValue >= 10000) {
        views = [NSString stringWithFormat:@"%.2f万", views.doubleValue/10000.0];
    }
    return views;
}

- (NSURL *)videoURLForRow:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:kVideoPath, [self modelForRow:row].uid];
    return [NSURL URLWithString:path];
}

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 0;
    switch (requestMode) {
        case RequestModeRefresh: {
            tmpPage = 0;
            break;
        }
        case RequestModeMore: {
            tmpPage = _page + 1;
            break;
        }
    }
    self.dataTask = [MMLiveNetManager getCategory:_slug page:tmpPage completionHandler:^(MMCategoryModel *model, NSError *error) {
        if (!error) {
            self.page = model.page;
            self.size = model.size;
            self.pageCount = model.pageCount;
            self.total = model.total;
            if (model.page == 0) {
                [self.roomlist removeAllObjects];
            }
            [self.roomlist addObjectsFromArray:model.data];
        }
        !completionHandler ?: completionHandler(error);
    }];
}

- (NSMutableArray *)roomlist {
    if(_roomlist == nil) {
        _roomlist = [[NSMutableArray alloc] init];
    }
    return _roomlist;
}
@end
