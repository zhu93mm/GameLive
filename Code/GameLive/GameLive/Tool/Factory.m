//
//  Factory.m
//  GameLive
//
//  Created by minmin on 16/7/6.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "Factory.h"
#import "MMPlayerViewController.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Factory
+ (void)addBackItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 44);
    [btn setImage:[UIImage imageNamed:@"返回_按下"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"返回_默认"] forState:UIControlStateHighlighted];
    
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    //把视图的边角变为圆形, cornerRadius圆角半径
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //弹簧控件, 修复边距
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,backItem];
}

+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (void)playVideo:(NSURL *)videoURL{
    MMPlayerViewController *vc = [MMPlayerViewController new];
    AVPlayerItem *playItem = [AVPlayerItem playerItemWithURL:videoURL];
    vc.player = [AVPlayer playerWithPlayerItem:playItem];
    [vc.player play];
    [kAppDelegate.window.rootViewController presentViewController:vc animated:YES completion:nil];
}

+ (void)addSearchItemToVC:(UIViewController *)vc clickHandler:(void (^)())clickHandler{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 44);
    [btn setImage:[UIImage imageNamed:@"搜索_按下"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"搜索_默认"] forState:UIControlStateHighlighted];
    [btn bk_addEventHandler:^(id sender) {
        clickHandler();
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    vc.navigationItem.rightBarButtonItems = @[spaceItem, backItem];
}

+(BOOL)isPhoneNumber:(NSString *)phoneNum{
    return phoneNum.length == 11 && phoneNum.doubleValue >10000000000;
}

@end
