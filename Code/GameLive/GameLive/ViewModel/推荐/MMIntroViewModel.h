//
//  MMIntroViewModel.h
//  GameLive
//
//  Created by minmin on 16/7/8.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMBaseViewModel.h"
#import "MMLiveNetManager.h"

@interface MMIntroViewModel : MMBaseViewModel

/* 头部滚动广告部分 */
@property (nonatomic) NSArray *indexList;
@property (nonatomic) NSInteger indexNumber;
- (MMIntroMobileModel *)indexModelForIndex:(NSInteger)index;
- (NSURL *)indexIconURLForIndex:(NSInteger)index;
- (NSString *)indexTitleForIndex:(NSInteger)index;
- (NSURL *)indexURLForIndex:(NSInteger)index;

/* 明星部分 */
@property (nonatomic) NSArray *starList;
@property (nonatomic) NSInteger starNumber;
- (NSString *)starNameForIndex:(NSInteger)index;
- (NSURL *)starIconURLForIndex:(NSInteger)index;
- (MMIntroMobileModel *)starModelForIndex:(NSInteger)index;
- (NSURL *)starVideoURLForIndex:(NSInteger)index;

/* 推荐部分 */
@property (nonatomic) NSInteger recommendNumber;
@property (nonatomic) NSArray *recommentList;
@property (nonatomic) NSArray *currentRecommendList;
/* 当前数据的起始索引值 */
@property (nonatomic) NSInteger recommendStartIndex;
- (void)changeCurrentRecommentList;
- (MMIntroMobileModel *)recommendModelForRow:(NSInteger)row;
- (NSURL *)recommendIconURLForRow:(NSInteger)row;
- (NSString *)recommendTitleForRow:(NSInteger)row;
- (NSString *)recommendNickForRow:(NSInteger)row;
- (NSString *)recommendViewForRow:(NSInteger)row;
- (NSURL *)recommendVideoURLForRow:(NSInteger)row;

/* 其他游戏直播 */
- (MMIntroLinkModel *)linkModelForIndexPath:(NSIndexPath *)indexPath;
@property (nonatomic) NSInteger linkNumber;
@property (nonatomic) NSArray *linkList;
- (NSInteger)linkNumberForSection:(NSInteger)section;
- (NSURL *)linkIconURLForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)linkTitleForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)linkNickForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)linkViewForIndexPath:(NSIndexPath *)indexPath;
- (NSURL *)linkVideoURLForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)linkCategoryNameForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)linkSlugForIndexPath:(NSIndexPath *)indexPath;

@end
