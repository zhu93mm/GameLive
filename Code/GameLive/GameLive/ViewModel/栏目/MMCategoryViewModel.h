//
//  MMCategoryViewModel.h
//  GameLive
//
//  Created by minmin on 16/6/28.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMBaseViewModel.h"

@interface MMCategoryViewModel : MMBaseViewModel

- (instancetype)initWithSlug:(NSString *)slug;
@property (nonatomic) NSString *slug;

@property (nonatomic) NSMutableArray *roomlist;
@property (nonatomic) NSInteger rowNumber;

@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger pageCount;
@property (nonatomic) NSInteger size;
@property (nonatomic) NSInteger total;

- (MMCategoryDataModel *)modelForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)nickForRow:(NSInteger)row;
- (NSString *)viewForRow:(NSInteger)row;
- (NSURL *)videoURLForRow:(NSInteger)row;
@end
