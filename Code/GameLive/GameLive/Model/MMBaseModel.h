//
//  MMBaseModel.h
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

/*
 作为所有Model的父类, 所有继承与此类的子类, 都会自动实现归档功能.
 并且自动替换属性名, 形式loveMe -> love_me形式
 默认转化键id和description关键词到ID和desc属性名
 详见.m文件
 */
@interface MMBaseModel : NSObject

@end
