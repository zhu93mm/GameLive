//
//  MMCategoryViewController.m
//  GameLive
//
//  Created by minmin on 16/6/27.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMCategoryViewController.h"
#import "MMLiveListCell.h"
#import "MMCategoryViewModel.h"

@interface MMCategoryViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic) MMCategoryViewModel *categoryVM;
@property (nonatomic) UICollectionView *categoryV;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;

@end

@implementation MMCategoryViewController
#pragma mark - Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.categoryVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MMLiveListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV setImageWithURL:[self.categoryVM iconURLForRow:indexPath.row] placeholder:[UIImage imageNamed:@"分类"]];
    cell.titleLb.text = [self.categoryVM titleForRow:indexPath.row];
    cell.nickLb.text = [self.categoryVM nickForRow:indexPath.row];
    cell.viewLb.text = [self.categoryVM viewForRow:indexPath.row];
    return cell;
}

#pragma mark - LifeCycle 生命周期
- (instancetype)initWithSlug:(NSString *)slug categoryName:(NSString *)categoryName{
    if (self = [super init]) {
        _slug = slug;
        _categoryName = categoryName;
        self.title = categoryName;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.categoryV beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad 懒加载
- (UICollectionView *)categoryV {
	if(_categoryV == nil) {
		_categoryV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _categoryV.backgroundColor = kBGColor;
        [self.view addSubview:_categoryV];
        [_categoryV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _categoryV.delegate = self;
        _categoryV.dataSource = self;
        
        WK(weakSelf);
        [_categoryV addHeaderRefresh:^{
            [weakSelf.categoryVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.categoryV reloadData];
                }else{
                    [weakSelf.view showWarning:error.localizedDescription];
                }
                if (weakSelf.categoryVM.page + 1 >= weakSelf.categoryVM.pageCount) {
                    [weakSelf.categoryV endFooterRefreshWithNoMoreData];
                }
                [weakSelf.categoryV endHeaderRefresh];
            }];
        }];
        [_categoryV addBackFooterRefresh:^{
            [weakSelf.categoryVM getDataWithRequestMode:RequestModeMore completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.categoryV reloadData];
                }else{
                    [weakSelf.view showWarning:error.localizedDescription];
                }
                if (weakSelf.categoryVM.page + 1 >= weakSelf.categoryVM.pageCount) {
                    [weakSelf.categoryV endFooterRefreshWithNoMoreData];
                }
                [weakSelf.categoryV endFooterRefresh];
            }];
        }];
        
        [_categoryV registerClass:[MMLiveListCell class] forCellWithReuseIdentifier:@"Cell"];
	}
	return _categoryV;
}

- (UICollectionViewFlowLayout *)flowLayout {
	if(_flowLayout == nil) {
		_flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
        _flowLayout.minimumLineSpacing = 8;
        _flowLayout.minimumInteritemSpacing = 8;
        CGFloat width = ([UIScreen mainScreen].bounds.size.width - 3 * 8)/2;
        CGFloat height = width * 255 / 350;
        _flowLayout.itemSize = CGSizeMake(width, height);
	}
	return _flowLayout;
}

- (MMCategoryViewModel *)categoryVM {
	if(_categoryVM == nil) {
		_categoryVM = [[MMCategoryViewModel alloc] initWithSlug:_slug];
	}
	return _categoryVM;
}

@end

