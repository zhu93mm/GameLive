//
//  MMIntroIndexCell.m
//  GameLive
//
//  Created by minmin on 16/7/7.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMIntroIndexCell.h"

@implementation MMIntroIndexCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.ic1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(110);
        }];
        [self.ic0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.bottom.equalTo(_ic1.mas_top).equalTo(0);
        }];
        [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
            if (_ic0.numberOfItems > 1) {
                [_ic0 scrollToItemAtIndex:_ic0.currentItemIndex + 1 animated:YES];
            }
        } repeats:YES];
        //最下方添加一条分割线
        UIView *lineView = [UIView new];
        lineView.backgroundColor = kRGBColor(180, 180, 180, 1);
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(0);
            make.height.equalTo(1);
        }];
    }
    return self;
}

- (iCarousel *)ic0 {
    if(_ic0 == nil) {
        _ic0 = [[iCarousel alloc] init];
        [self.contentView addSubview:self.ic0];
        _ic0.tag = 1000;
        _ic0.pagingEnabled = YES;
        _ic0.scrollSpeed = 1;
        [_ic0 addSubview:self.grayView];
        [_grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
    }
    return _ic0;
}

- (iCarousel *)ic1 {
    if(_ic1 == nil) {
        _ic1 = [[iCarousel alloc] init];
        _ic1.tag = 2000;
        [self.contentView addSubview:_ic1];
        _ic1.autoscroll = YES;
    }
    return _ic1;
}

- (UIView *)grayView {
    if(_grayView == nil) {
        _grayView = [[UIView alloc] init];
        _grayView.backgroundColor = kRGBColor(0, 0, 0, 0.4);
        [_grayView addSubview:self.titleLb];
        [_grayView addSubview:self.pageControl];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-8);
        }];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-8);
        }];
    }
    return _grayView;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.textColor = [UIColor colorWithWhite:1 alpha:0.7];
    }
    return _titleLb;
}

- (UIPageControl *)pageControl {
    if(_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.currentPageIndicatorTintColor = kRGBColor(251, 51, 41, 1);
        _pageControl.pageIndicatorTintColor = kRGBColor(199, 197, 197, 1);
    }
    return _pageControl;
}

- (void)setIcDelegate:(id<iCarouselDelegate,iCarouselDataSource>)icDelegate{
    self.ic0.delegate = icDelegate;
    self.ic1.delegate = icDelegate;
    self.ic0.dataSource = icDelegate;
    self.ic1.dataSource = icDelegate;
}

@end
