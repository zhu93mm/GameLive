//
//  MMChatViewController.m
//  GameLive
//
//  Created by minmin on 16/6/29.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMChatViewController.h"

@interface MMChatViewController ()

@end

@implementation MMChatViewController
#pragma mark - LifeCycle 生命周期
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"聊一聊";
        self.tabBarItem.image = [UIImage imageNamed:@"我的_默认"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"我的-焦点"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}



@end
