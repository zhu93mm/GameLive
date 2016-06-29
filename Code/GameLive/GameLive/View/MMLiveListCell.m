//
//  MMLiveListCell.m
//  GameLive
//
//  Created by minmin on 16/6/27.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMLiveListCell.h"

@implementation MMLiveListCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self iconIV];
        [self titleLb];
    }
    return self;
}

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(-30);
        }];
        _iconIV.backgroundColor = [UIColor grayColor];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
        view.backgroundColor = kRGBColor(0, 0, 0, 0.5);
        [_iconIV addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(20);
        }];
        
        UIImageView *nickIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"主播名"]];
        [view addSubview:nickIV];
        [nickIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.centerY.equalTo(0);
        }];
        
        [view addSubview:self.nickLb];
        [self.nickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(nickIV.mas_right).equalTo(5);
            make.width.lessThanOrEqualTo(view.mas_width).dividedBy(2);
        }];
        
        [view addSubview:self.viewLb];
        [self.viewLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-5);
        }];
        
        UIImageView *viewIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"观看人数"]];
        [view addSubview:viewIV];
        [viewIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(self.viewLb.mas_left).equalTo(-5);
        }];
    }
    return _iconIV;
}

- (UILabel *)nickLb {
    if(_nickLb == nil) {
        _nickLb = [[UILabel alloc] init];
        _nickLb.textColor = [UIColor whiteColor];
        _nickLb.font = [UIFont systemFontOfSize:12];
    }
    return _nickLb;
}

- (UILabel *)viewLb {
    if(_viewLb == nil) {
        _viewLb = [[UILabel alloc] init];
        _viewLb.textColor = [UIColor whiteColor];
        _viewLb.font = [UIFont systemFontOfSize:12];
    }
    return _viewLb;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.backgroundColor = [UIColor whiteColor];
        _titleLb.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
    }
    return _titleLb;
}
@end
