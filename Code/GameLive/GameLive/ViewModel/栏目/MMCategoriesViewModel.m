//
//  MMCategoriesViewModel.m
//  GameLive
//
//  Created by minmin on 16/6/27.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMCategoriesViewModel.h"

@implementation MMCategoriesViewModel

- (MMCategoriesModel *)modelForRow:(NSInteger)row{
    return self.categories[row];
}

- (NSInteger)rowNumber{
    return self.categories.count;
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].thumb];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [MMLiveNetManager getCategories:kcategoriesPath parameters:nil completionHandler:^(id model, NSError *error) {
        if (!error) {
            self.categories = model;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

@end

