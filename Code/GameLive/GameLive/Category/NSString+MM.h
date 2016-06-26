//
//  NSString+MM.h
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MM)

@property (nonatomic, readonly) NSURL *mm_URL;

@property (nonatomic, readonly) NSURL *mm_fileURL;

@property (nonatomic, readonly) UIImage *mm_image;

@property (nonatomic, readonly) UIImageView *mm_imageView;

@end
