//
//  MMLiveListModel.h
//  TRProject
//
//  Created by minmin on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MMLiveListRecommendModel,MMLiveListRecommendDataModel,MMLiveListDataLinkObjectModel,MMLiveListDataModel;
@interface MMLiveListModel : NSObject

@property (nonatomic, strong) MMLiveListRecommendModel *recommend;

@property (nonatomic, strong) NSArray<MMLiveListDataModel *> *data;

@property (nonatomic, assign) NSInteger pageCount;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, copy) NSString *icon;

@end
@interface MMLiveListRecommendModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, strong) NSArray<MMLiveListRecommendDataModel *> *data;

@end

@interface MMLiveListRecommendDataModel : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger slot_id;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, strong) MMLiveListDataLinkObjectModel *link_object;

@property (nonatomic, copy) NSString *ext;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *fk;

@end

@interface MMLiveListDataLinkObjectModel : NSObject

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *weight_add;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *follow_add;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, copy) NSString *play_count;

@property (nonatomic, copy) NSString *negative_view;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *coin;

@property (nonatomic, copy) NSString *coin_add;

@property (nonatomic, copy) NSString *default_image;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *recommend_image;

@property (nonatomic, copy) NSString *locked_view;

@property (nonatomic, copy) NSString *last_end_at;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, copy) NSString *first_play_at;

@property (nonatomic, copy) NSString *announcement;

@property (nonatomic, copy) NSString *follow;

@property (nonatomic, copy) NSString *follow_bak;

@property (nonatomic, copy) NSString *play_at;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, copy) NSString *category_slug;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *app_shuffling_image;

@end

@interface MMLiveListDataModel : NSObject

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *weight_add;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *follow_add;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, copy) NSString *play_count;

@property (nonatomic, copy) NSString *negative_view;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *coin;

@property (nonatomic, copy) NSString *coin_add;

@property (nonatomic, copy) NSString *default_image;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *recommend_image;

@property (nonatomic, copy) NSString *locked_view;

@property (nonatomic, copy) NSString *last_end_at;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, copy) NSString *first_play_at;

@property (nonatomic, copy) NSString *announcement;

@property (nonatomic, assign) NSInteger follow;

@property (nonatomic, copy) NSString *follow_bak;

@property (nonatomic, copy) NSString *play_at;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, copy) NSString *category_slug;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *app_shuffling_image;

@end

