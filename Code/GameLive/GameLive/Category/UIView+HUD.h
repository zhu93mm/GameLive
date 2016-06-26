//
//  UIView+HUD.h
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface UIView (HUD)
//忙提示
- (void)showBusyHUD;
//文字提示
- (void)showWarning:(NSString *)warning;
//隐藏提示
- (void)hideBusyHUD;
@end
