//
//  MMSearchViewController.m
//  GameLive
//
//  Created by minmin on 16/7/11.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMSearchViewController.h"
#import "MMSearchViewModel.h"
#import "MMCategoryCell.h"

@interface MMSearchViewController ()<UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic) UISearchBar *searchBar;
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) MMSearchViewModel *searchVM;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;

@end

@implementation MMSearchViewController
#pragma mark - UICollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.searchVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MMCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV setImageWithURL:[self.searchVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"分类"]];
    cell.titleLb.text = [self.searchVM titleForRow:indexPath.row];
    cell.viewLb.text = [self.searchVM viewForRow:indexPath.row];
    cell.nickLb.text = [self.searchVM nickForRow:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [Factory playVideo:[self.searchVM videoURLForRow:indexPath.row]];
}

#pragma mark - Methods 
- (void)search{
    [_searchBar resignFirstResponder];
    NSString *words = _searchBar.text;
    if (words.length == 0) {
        [self.view showWarning:@"请输入搜索内容"];
        return;
    }
    self.searchVM.words = words;
    [self.view showBusyHUD];
    [self.searchVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
        [self.view hideBusyHUD];
        if (!error) {
            [_collectionView reloadData];
            if (!self.searchVM.isHasMore) {
                [_collectionView endFooterRefreshWithNoMoreData];
            }
        }
    }];
}

#pragma mark - UISearchBar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self search];
}

#pragma mark - LifeCycle 生命周期
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
        _searchBar = [UISearchBar new];
        self.navigationItem.titleView = _searchBar;
        _searchBar.placeholder = @"请输入关键词搜索";
        _searchBar.delegate = self;
        [Factory addSearchItemToVC:self clickHandler:^{
            [self search];
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBGColor;
    [Factory addBackItemToVC:self];
    [self collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad 懒加载
- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = kBGColor;
        WK(weakSelf);
        [_collectionView addBackFooterRefresh:^{
            [weakSelf.searchVM getDataWithRequestMode:RequestModeMore completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                    if (weakSelf.searchVM.hasMore) {
                        [weakSelf.collectionView endFooterRefresh];
                    }else{
                        [weakSelf.collectionView endFooterRefreshWithNoMoreData];
                    }
                }else {
                    [weakSelf.view showWarning:error.localizedDescription];
                }
            }];
        }];
        [_collectionView registerClass:[MMCategoryCell class] forCellWithReuseIdentifier:@"Cell"];
        //没有搜索内容时的空显示
        UIImageView *iconIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"搜索无结果"]];
        _collectionView.backgroundView = iconIV;
        iconIV.contentMode = UIViewContentModeCenter;
	}
	return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
	if(_flowLayout == nil) {
		_flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
        _flowLayout.minimumLineSpacing = 8;
        _flowLayout.minimumInteritemSpacing = 8;
        CGFloat width = (kScreenW - 3 * 8)/2;
        CGFloat height = width *266 / 350;
        _flowLayout.itemSize = CGSizeMake(width, height);
	}
	return _flowLayout;
}

- (MMSearchViewModel *)searchVM {
    if(_searchVM == nil) {
        _searchVM = [[MMSearchViewModel alloc] init];
    }
    return _searchVM;
}

@end
