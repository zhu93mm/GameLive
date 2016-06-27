//
//  MMCategoryViewController.m
//  GameLive
//
//  Created by minmin on 16/6/27.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMCategoryViewController.h"

@interface MMCategoryViewController ()

@end

@implementation MMCategoryViewController
#pragma mark - LifeCycle 生命周期
- (instancetype)initWithSlug:(NSString *)slug categoryName:(NSString *)categoryName{
    _slug = slug;
    _categoryName = categoryName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

