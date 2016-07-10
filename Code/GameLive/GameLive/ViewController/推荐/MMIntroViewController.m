//
//  MMIntroViewController.m
//  GameLive
//
//  Created by minmin on 16/7/7.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMIntroViewController.h"
#import <iCarousel.h>
#import "MMIntroIndexCell.h"
#import "MMCategoryCell.h"
#import "MMIntroViewModel.h"

@interface MMIntroViewController ()<iCarouselDelegate, iCarouselDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) MMIntroViewModel *IntroVM;

@end

@implementation MMIntroViewController
#pragma mark - iCarousel Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    if (carousel.tag == 1000) {
//        NSLog(@"%d", self.IntroVM.indexNumber);
        return self.IntroVM.indexNumber;
    }
    return self.IntroVM.starNumber;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (carousel.tag == 1000) {
        if (!view) {
            view = [[UIView alloc] initWithFrame:carousel.bounds];
            view.clipsToBounds = YES;
            UIImageView *iconIV = [UIImageView new];
            [view addSubview:iconIV];
            [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(0);
            }];
            iconIV.contentMode = UIViewContentModeScaleAspectFill;
            iconIV.tag = 10000;
        }
        UIImageView *iconIV = (UIImageView *)[view viewWithTag:10000];
        [iconIV setImageWithURL:nil placeholder:[UIImage imageNamed:@"分类"]];
        return view;
    }else{
        if (!view) {
            view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, carousel.bounds.size.height)];
            view.clipsToBounds = YES;
            UILabel *nameLb = [UILabel new];
            [view addSubview:nameLb];
            [nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(0);
                make.bottom.equalTo(-6);
            }];
            nameLb.tag = 100;
            UIImageView *iconIV = [[UIImageView alloc] init];
            [view addSubview:iconIV];
            [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(0);
                make.top.equalTo(10);
                make.size.equalTo(CGSizeMake(56, 56));
            }];
            iconIV.clipsToBounds = YES;
            iconIV.layer.cornerRadius = 28;
            iconIV.tag = 200;
        }
        UILabel *nameLb = (UILabel *)[view viewWithTag:100];
        nameLb.text = @"hello world";
        UIImageView *iconIV = (UIImageView *)[view viewWithTag:200];
        [iconIV setImageWithURL:nil placeholder:[UIImage imageNamed:@"分类"]];
        return view;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout Delegate
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section != 0) {
        return UIEdgeInsetsMake(8, 8, 8, 8);
    }
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section != 0) {
        return 8;
    }
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section != 0) {
        return 8;
    }
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //0 748 416
    if (indexPath.section == 0) {
        return CGSizeMake(kScreenW, kScreenW * 416 / 748 + 100);
    }else{
        CGFloat width = (kScreenW - 3 * 8)/2;
        //350 266
        CGFloat height = width * 266 / 350;
        return CGSizeMake(width, height);
    }
    return CGSizeZero;
}

#pragma mark - collectionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 2;
    }
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MMIntroIndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MMIntroIndexCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        cell.icDelegate = self;
        return cell;
    }else if (indexPath.section == 1) {
        MMCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MMCategoryCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        return cell;
    }else{
        MMCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MMCategoryCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        return cell;
    }
}

#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"推荐";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad 懒加载
- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[MMIntroIndexCell class] forCellWithReuseIdentifier:@"MMIntroIndexCell"];
        [_collectionView registerClass:[MMCategoryCell class] forCellWithReuseIdentifier:@"MMCategoryCell"];
        WK(weakSelf);
        [_collectionView addHeaderRefresh:^{
            [weakSelf.IntroVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                }
                [weakSelf.collectionView endHeaderRefresh];
            }];
        }];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.backgroundColor = kBGColor;
	}
	return _collectionView;
}

- (MMIntroViewModel *)IntroVM {
	if(_IntroVM == nil) {
		_IntroVM = [[MMIntroViewModel alloc] init];
	}
	return _IntroVM;
}

@end
