//
//  MMCategoriesViewModel.h
//  GameLive
//
//  Created by minmin on 16/6/27.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMBaseViewModel.h"
#import "MMLiveNetManager.h"

@interface MMCategoriesViewModel : MMBaseViewModel
@property (nonatomic) NSInteger rowNumber;
@property (nonatomic) NSArray *categories;

- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (MMCategoriesModel *)modelForRow:(NSInteger)row;
- (NSString *)slugForRow:(NSInteger)row;
- (NSString *)categoryNameForRow:(NSInteger)row;

@end
