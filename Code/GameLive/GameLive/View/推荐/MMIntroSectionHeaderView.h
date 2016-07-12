//
//  MMIntroSectionHeaderView.h
//  GameLive
//
//  Created by minmin on 16/7/11.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMIntroSectionHeaderView;

@protocol MMIntroSectionHeaderViewDelegate<NSObject>
//头部右侧按钮被点击后触发
- (void)introSectionHeaderView:(MMIntroSectionHeaderView *)headerView clickBtnAtIndexPath:(NSIndexPath *)indexPath;
@end

typedef NS_ENUM(NSUInteger, IntroBtnMode) {
    IntroBtnModeChange,
    IntroBtnModeMore,
};

@interface MMIntroSectionHeaderView : UICollectionReusableView

@property (nonatomic) UILabel *titleLb;
@property (nonatomic) NSIndexPath *indexPath;
@property (nonatomic) IntroBtnMode btnMode;
@property (nonatomic) id<MMIntroSectionHeaderViewDelegate> delegate;
/** 换一换功能 */
@property (nonatomic) UIControl *changeControl;
/** 更多功能 */
@property (nonatomic) UIControl *moreControl;

@end
