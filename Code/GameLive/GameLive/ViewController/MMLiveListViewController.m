//
//  MMLiveListViewController.m
//  GameLive
//
//  Created by minmin on 16/6/27.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMLiveListViewController.h"
#import "MMLiveListCell.h"
#import "MMLiveListViewModel.h"

@interface MMLiveListViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic) MMLiveListViewModel *liveListVM;
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;
@end

@implementation MMLiveListViewController
#pragma mark - Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.liveListVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MMLiveListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    [cell.iconIV setImageWithURL:[self.liveListVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"分类"]];
    cell.titleLb.text = [self.liveListVM titleForRow:indexPath.row];
    cell.viewLb.text = [self.liveListVM viewForRow:indexPath.row];
    cell.nickLb.text = [self.liveListVM nickForRow:indexPath.row];
    return cell;
}

#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"直播";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = kBGColor;
        [self.view addSubview:_collectionView];
        [_collectionView  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        //刷新操作
        WK(weakSelf);
        [_collectionView addHeaderRefresh:^{
            [weakSelf.liveListVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                }else{
                    [weakSelf.view showWarning:error.localizedDescription];
                }
                if (weakSelf.liveListVM.page >= weakSelf.liveListVM.pageCount) {
                    [weakSelf.collectionView endFooterRefreshWithNoMoreData];
                }
                [weakSelf.collectionView endHeaderRefresh];
            }];
        }];
        
        [_collectionView addBackFooterRefresh:^{
            [weakSelf.liveListVM getDataWithRequestMode:RequestModeMore completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                }else{
                    [weakSelf.view showWarning:error.localizedDescription];
                }
                if (weakSelf.liveListVM.page + 1 >= weakSelf.liveListVM.pageCount) {
                    [weakSelf.collectionView endFooterRefreshWithNoMoreData];
                }else{
                    [weakSelf.collectionView endFooterRefresh];
                }
                
            }];
        }];
        
        [_collectionView registerClass:[MMLiveListCell class] forCellWithReuseIdentifier:@"Cell"];
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
        CGFloat height = width * 255 / 350;
        _flowLayout.itemSize = CGSizeMake(width, height);
	}
	return _flowLayout;
}

#pragma mark - LazyLoad 懒加载
- (MMLiveListViewModel *)liveListVM {
	if(_liveListVM == nil) {
		_liveListVM = [[MMLiveListViewModel alloc] init];
	}
	return _liveListVM;
}

@end
