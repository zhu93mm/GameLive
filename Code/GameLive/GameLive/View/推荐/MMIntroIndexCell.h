//
//  MMIntroIndexCell.h
//  GameLive
//
//  Created by minmin on 16/7/7.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface MMIntroIndexCell : UICollectionViewCell

@property (nonatomic) iCarousel *ic0;
@property (nonatomic) iCarousel *ic1;

@property (nonatomic) UIView *grayView;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UIPageControl *pageControl;

@property (nonatomic, weak) id<iCarouselDelegate, iCarouselDataSource> icDelegate;

@end
