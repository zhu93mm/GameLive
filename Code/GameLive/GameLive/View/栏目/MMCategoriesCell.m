//
//  MMCategoriesCell.m
//  GameLive
//
//  Created by minmin on 16/6/27.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMCategoriesCell.h"

@implementation MMCategoriesCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIView *whiteV = [[UIView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:whiteV];
        [whiteV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        [self iconIV];
        [self nameLb];
    }
    return self;
}

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _iconIV;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.bottom.equalTo(-3);
            make.height.equalTo(33);
        }];
    }
    return _nameLb;
}

@end
