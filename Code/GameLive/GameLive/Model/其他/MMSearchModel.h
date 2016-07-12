//
//  MMSearchModel.h
//  GameLive
//
//  Created by minmin on 16/7/11.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMBaseModel.h"

@class MMSearchDataModel, MMSearchDataItemsModel;
@interface MMSearchModel : MMBaseModel

@property (nonatomic, strong) MMSearchDataModel *data;
@property (nonatomic, assign) NSInteger code;

@end
@interface MMSearchDataModel : MMBaseModel

@property (nonatomic, assign) NSInteger playStatus;

@property (nonatomic, assign) NSInteger pageNb;

@property (nonatomic, strong) NSArray<MMSearchDataItemsModel *> *items;

@property (nonatomic, assign) NSInteger total;

@end

@interface MMSearchDataItemsModel : MMBaseModel

@property (nonatomic, copy) NSString *categorySlug;

@property (nonatomic, assign) NSString *uid;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *view;

@end
