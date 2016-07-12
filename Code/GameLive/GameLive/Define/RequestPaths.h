//
//  RequestPaths.h
//  GameLive
//
//  Created by minmin on 16/6/26.
//  Copyright © 2016年 minmin. All rights reserved.
//

#ifndef RequestPaths_h
#define RequestPaths_h

#define kBasePath @"http://www.quanmin.tv"

/** 直播栏目类型列表 */
#define kcategoriesPath @"/json/categories/list.json"

/** 某栏目房间列表 */
#define kCategoryRoomsPath @"/json/categories/%@/list%@.json"

/** 搜索功能 */
#define kSearchPath @"api/v1"

/**直播房间列表*/
#define kRoomsPath @"/json/play/list%@.json"

/** 直播视频的网址 */
#define kVideoPath @"http://hls.quanmin.tv/live/%@/playlist.m3u8"

/** 推荐页面 */
#define kIntroPath @"json/page/app-index/info.json"

#endif /* RequestPaths_h */
