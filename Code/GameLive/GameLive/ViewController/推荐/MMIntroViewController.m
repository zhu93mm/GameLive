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
#import "MMIntroSectionHeaderView.h"
#import "MMCategoryViewController.h"
#import "MMSearchViewController.h"

@interface MMIntroViewController ()<iCarouselDelegate, iCarouselDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MMIntroSectionHeaderViewDelegate>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) MMIntroViewModel *introVM;

@end

@implementation MMIntroViewController
#pragma mark - TRIntroSectionHeaderView Delegate
- (void)introSectionHeaderView:(MMIntroSectionHeaderView *)headerView clickBtnAtIndexPath:(NSIndexPath *)indexPath{
    switch (headerView.btnMode) {
        case IntroBtnModeChange: {
            [self.introVM changeCurrentRecommentList];
            [_collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
            break;
        }
        case IntroBtnModeMore: {
            NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 2];
            MMCategoryViewController *vc = [[MMCategoryViewController alloc] initWithSlug:[self.introVM linkSlugForIndexPath:tmpIndexPath] categoryName:[self.introVM linkCategoryNameForIndexPath:tmpIndexPath]];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
    }
}

#pragma mark - iCarousel Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    if (carousel.tag == 1000) {
        return self.introVM.indexNumber;
    }
    return self.introVM.starNumber;
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
        [iconIV setImageWithURL:[self.introVM indexIconURLForIndex:index] placeholder:[UIImage imageNamed:@"分类"]];
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
        nameLb.text = [self.introVM starNameForIndex:index];
        UIImageView *iconIV = (UIImageView *)[view viewWithTag:200];
        [iconIV setImageWithURL:[self.introVM starIconURLForIndex:index] placeholder:[UIImage imageNamed:@"分类"]];
        return view;
    }
    return nil;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if (carousel.tag == 1000) {
        [Factory playVideo:[self.introVM indexURLForIndex:index]];
    }
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    if (carousel.tag == 1000) {
        NSInteger index = carousel.currentItemIndex;
        MMIntroIndexCell *cell = (MMIntroIndexCell *)[_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.titleLb.text = [self.introVM indexTitleForIndex:index];
        cell.pageControl.currentPage = index;
    }
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeZero;
    }
    return CGSizeMake(kScreenW, 35);
}

#pragma mark - collectionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2 + self.introVM.linkNumber;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 2;
    }
    return [self.introVM linkNumberForSection:section - 2];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MMIntroIndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MMIntroIndexCell" forIndexPath:indexPath];
        cell.icDelegate = self;
        cell.pageControl.numberOfPages = self.introVM.indexNumber;
        cell.pageControl.currentPage = 0;
        cell.titleLb.text = [self.introVM indexTitleForIndex:indexPath.row];
        [cell.ic0 reloadData];
        [cell.ic1 reloadData];
        return cell;
    }else if (indexPath.section == 1) {
        MMCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MMCategoryCell" forIndexPath:indexPath];
        NSInteger row = indexPath.row;
        cell.titleLb.text = [self.introVM recommendTitleForRow:row];
        cell.viewLb.text = [self.introVM recommendViewForRow:row];
        cell.nickLb.text = [self.introVM recommendNickForRow:row];
        [cell.iconIV setImageWithURL:[self.introVM recommendIconURLForRow:row] placeholder:[UIImage imageNamed:@"分类"]];
        return cell;
    }else{
        MMCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MMCategoryCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 2];
        cell.titleLb.text = [self.introVM linkTitleForIndexPath:tmpIndexPath];
        cell.viewLb.text = [self.introVM linkViewForIndexPath:tmpIndexPath];
        cell.nickLb.text = [self.introVM linkNickForIndexPath:tmpIndexPath];
        [cell.iconIV setImageWithURL:[self.introVM linkIconURLForIndexPath:tmpIndexPath] placeholderImage:[UIImage imageNamed:@"分类"]];
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        [Factory playVideo:[self.introVM recommendVideoURLForRow:indexPath.row]];
    }
    if (indexPath.section > 1) {
        NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 2];
        [Factory playVideo:[self.introVM linkVideoURLForIndexPath:tmpIndexPath]];
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return nil;
    }
    MMIntroSectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MMIntroSectionHeaderView" forIndexPath:indexPath];
    if (indexPath.section == 1) {
        headerView.btnMode = IntroBtnModeChange;
        headerView.titleLb.text = @"精彩推荐";
    }
    if (indexPath.section > 1) {
        headerView.btnMode = IntroBtnModeMore;
        NSIndexPath *tmpIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section - 2];
        headerView.titleLb.text = [self.introVM linkCategoryNameForIndexPath:tmpIndexPath];
    }
    headerView.indexPath = indexPath;
    headerView.delegate = self;
    return headerView;
}

#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"推荐_默认"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"推荐-焦点"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView beginHeaderRefresh];
    [Factory addSearchItemToVC:self clickHandler:^{
        MMSearchViewController *vc = [MMSearchViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }];
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
        [_collectionView registerClass:[MMIntroSectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MMIntroSectionHeaderView"];
        WK(weakSelf);
        [_collectionView addHeaderRefresh:^{
            [weakSelf.introVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
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

- (MMIntroViewModel *)introVM {
	if(_introVM == nil) {
		_introVM = [[MMIntroViewModel alloc] init];
	}
	return _introVM;
}

@end
