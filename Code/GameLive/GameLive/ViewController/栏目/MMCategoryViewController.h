//
//  MMCategoryViewController.h
//  GameLive
//
//  Created by minmin on 16/6/27.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMBaseViewController.h"

@interface MMCategoryViewController : MMBaseViewController
@property (nonatomic) NSString *slug;
@property (nonatomic) NSString *categoryName;
- (instancetype)initWithSlug:(NSString *)slug categoryName:(NSString *)categoryName;

@end


