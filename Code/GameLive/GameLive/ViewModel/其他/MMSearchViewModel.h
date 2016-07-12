//
//  MMSearchViewModel.h
//  GameLive
//
//  Created by minmin on 16/7/11.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMBaseViewModel.h"
#import "MMLiveNetManager.h"

@interface MMSearchViewModel : MMBaseViewModel
@property (nonatomic) NSString *words;
@property (nonatomic) NSMutableArray<MMSearchDataItemsModel *> *items;
@property (nonatomic) NSInteger rowNumber;
- (MMSearchDataItemsModel *)modelForRow:(NSInteger)row;
@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger total;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)nickForRow:(NSInteger)row;
- (NSString *)viewForRow:(NSInteger)row;
- (NSURL *)videoURLForRow:(NSInteger)row;
@property (nonatomic, getter=isHasMore) BOOL hasMore;
@end
