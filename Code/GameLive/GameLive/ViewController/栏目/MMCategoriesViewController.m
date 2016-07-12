//
//  MMCategoriesViewController.m
//  GameLive
//
//  Created by minmin on 16/6/27.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMCategoriesViewController.h"
#import "MMCategoriesViewModel.h"
#import "MMCategoriesCell.h"
#import "MMCategoryViewController.h"

@interface MMCategoriesViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic) MMCategoriesViewModel *cateVM;
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *flowLayer;
@property (nonatomic) NSArray<MMCategoriesModel *> *tmpCateData;

@end

@implementation MMCategoriesViewController
#pragma mark - Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.cateVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MMCategoriesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    [cell.iconIV setImageWithURL:[self.cateVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"分类"]];
    cell.nameLb.text = [self.cateVM titleForRow:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //[collectionView deselectItemAtIndexPath:indexPath animated:YES];
    MMCategoryViewController *categoryVC = [[MMCategoryViewController alloc] initWithSlug:[self.cateVM slugForRow:indexPath.row] categoryName:[self.cateVM categoryNameForRow:indexPath.row]];
    [self.navigationController pushViewController:categoryVC animated:YES];
}


#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"栏目";
        self.tabBarItem.image = [UIImage imageNamed:@"栏目-默认"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"栏目-焦点"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"游戏栏目";
    
    [self.collectionView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad 懒加载
- (MMCategoriesViewModel *)cateVM {
	if(_cateVM == nil) {
		_cateVM = [[MMCategoriesViewModel alloc] init];
	}
	return _cateVM;
}

- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayer];
        [self.view addSubview:_collectionView];
        [_collectionView  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = kBGColor;
        
        WK(weakSelf);
        [_collectionView addHeaderRefresh:^{
            [weakSelf.cateVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
                if (error) {
                    NSLog(@"%@", error);
                }else{
                    [weakSelf.collectionView reloadData];
                }
                [weakSelf.collectionView endHeaderRefresh];
            }];
        }];
        
        
        [_collectionView registerClass:[MMCategoriesCell class] forCellWithReuseIdentifier:@"Cell"];
	}
	return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayer {
	if(_flowLayer == nil) {
		_flowLayer = [[UICollectionViewFlowLayout alloc] init];
        _flowLayer.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
        _flowLayer.minimumLineSpacing = 8;
        _flowLayer.minimumInteritemSpacing = 8;
        CGFloat width = (kScreenW - 4 * 8)/3;
        CGFloat height = width * 350 / 266;
        _flowLayer.itemSize = CGSizeMake(width, height);
        
	}
	return _flowLayer;
}

- (NSArray *)tmpCateData {
	if(_tmpCateData == nil) {
		_tmpCateData = [[NSArray alloc] init];
	}
	return _tmpCateData;
}

@end
