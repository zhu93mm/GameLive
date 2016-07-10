//
//  Factory.m
//  GameLive
//
//  Created by minmin on 16/7/6.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "Factory.h"
#import "MMPlayerViewController.h"

@implementation Factory
+ (void)addBackItemToVC:(UIViewController *)vc{
    
}

+ (void)playVideo:(NSURL *)videoURL{
    MMPlayerViewController *vc = [MMPlayerViewController new];
    AVPlayerItem *playItem = [AVPlayerItem playerItemWithURL:videoURL];
    vc.player = [AVPlayer playerWithPlayerItem:playItem];
    [vc.player play];
    [kAppDelegate.window.rootViewController presentViewController:vc animated:YES completion:nil];
}

+ (void)addSearchItemToVC:(UIViewController *)vc clickHandler:(void (^)())clickHandler{
    
}

+(BOOL)isPhoneNumber:(NSString *)phoneNum{
    return phoneNum.length == 11 && phoneNum.doubleValue >10000000000;
}

@end
