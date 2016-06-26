//
//  NSString+MM.m
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "NSString+MM.h"

@implementation NSString (MM)

- (NSURL *)mm_URL{
    return [NSURL URLWithString:self];
}

- (NSURL *)mm_fileURL{
    return [NSURL fileURLWithPath:self];
}

- (UIImage *)mm_image{
    return [UIImage imageNamed:self];
}

- (UIImageView *)mm_imageView{
    return [[UIImageView alloc] initWithImage:self.mm_image];
}

@end
