//
//  MMPlayerViewController.m
//  GameLive
//
//  Created by minmin on 16/6/29.
//  Copyright © 2016年 minmin. All rights reserved.
//

#import "MMPlayerViewController.h"

@interface MMPlayerViewController ()

@end

@implementation MMPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.player.currentItem addObserver:self forKeyPath:@"playbackBufferEmpty" options:NSKeyValueObservingOptionNew context:playbackContext];
    [self.player.currentItem addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options:NSKeyValueObservingOptionNew context:playbackContext];
}

- (void)dealloc{
    [self.player.currentItem removeObserver:self forKeyPath:@"playbackBufferEmpty" context:playbackContext];
    [self.player.currentItem removeObserver:self forKeyPath:@"playbackLikelyToKeepUp" context:playbackContext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

static void *playbackContext = &playbackContext;
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    //如果视频出现暂停情况，则把当前播放暂停 然后重新播放
    if (context == playbackContext) {
        [self.player pause];
        [self.player play];
        return;
    }
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
