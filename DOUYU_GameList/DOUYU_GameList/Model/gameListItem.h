//
//  gameListItem.h
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gameListItem : NSObject
/** 数组 */
@property(nonatomic,strong)NSArray *data;

/** 错误信息 */
@property(nonatomic,strong)NSNumber *error;


@end


@interface gameListDataItem : NSObject

/** cate_id */
@property(nonatomic,strong)NSString *cate_id;
/** game_icon */
@property(nonatomic,strong)NSString *game_icon;
/** game_name */
@property(nonatomic,strong)NSString *game_name;
/** game_src */
@property(nonatomic,strong)NSString *game_src;
/** game_url */
@property(nonatomic,strong)NSString *game_url;
/** online_room */
@property(nonatomic,strong)NSString *online_room;
/** online_room_ios */
@property(nonatomic,strong)NSString *online_room_ios;
/** short_name */
@property(nonatomic,strong)NSString *short_name;

@end


/*
 "cate_id": "181",
 "game_icon": "https://staticlive.douyucdn.cn/upload/game_cate/f719087663581b7a723c4d39f8721bc1.jpg",
 "game_name": "王者荣耀",
 "game_src": "https://staticlive.douyucdn.cn/upload/game_cate/b14b8890330ca7cb5185b954808485fc.jpg",
 "game_url": "/directory/game/wzry",
 "online_room": "304",
 "online_room_ios": "140",
 "short_name": "wzry"
 */
