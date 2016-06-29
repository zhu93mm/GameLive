//
//  MMLiveListViewModel.h
//  GameLive
//
//  Created by minmin on 16/6/28.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMBaseViewModel.h"
#import "MMLiveListViewModel.h"

@interface MMLiveListViewModel : MMBaseViewModel
@property (nonatomic) NSInteger rowNumber;
@property (nonatomic) NSMutableArray *roomList;

@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger pageCount;
@property (nonatomic) NSInteger size;
@property (nonatomic) NSInteger total;

- (MMLiveListDataModel *)modelForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)nickForRow:(NSInteger)row;
- (NSString *)viewForRow:(NSInteger)row;
- (NSURL *)videoURLForRow:(NSInteger)row;

@end
