//
//  RoomItem.h
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/8.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RoomItem : NSObject
@property (nonatomic, strong) NSNumber *error;
@property (nonatomic, strong) NSArray *data;



@end


@interface RoomDataItem : NSObject

@property (nonatomic, strong) NSString *room_id;
//房间图片
@property (nonatomic, strong) NSString *room_src;
@property (nonatomic, strong) NSString *vertical_src;
@property (nonatomic, strong) NSNumber *isVertical;
@property (nonatomic, strong) NSString *cate_id;
//房间下方的名称
@property (nonatomic, strong) NSString *room_name;
@property (nonatomic, strong) NSString *show_status;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *show_time;
@property (nonatomic, strong) NSString *owner_uid;
@property (nonatomic, strong) NSString *specific_catalog;
@property (nonatomic, strong) NSString *specific_status;
@property (nonatomic, strong) NSString *vod_quality;
//在线人数
@property (nonatomic, strong) NSNumber *online;
//房间主播
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *game_url;
@property (nonatomic, strong) NSString *game_name;
@property (nonatomic, strong) NSString *child_id;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *avatar_mid;
@property (nonatomic, strong) NSString *avatar_small;
@property (nonatomic, strong) NSString *jumpUrl;
@property (nonatomic, strong) NSString *fans;
@property (nonatomic, strong) NSString *ranktype;
@property (nonatomic, strong) NSString *anchor_city;




@end


/*
 "room_id": "656574",
 "room_src": "https://rpic.douyucdn.cn/a1701/06/13/656574_170106135037.jpg",
 "vertical_src": "https://rpic.douyucdn.cn/a1701/06/13/656574_170106135037.jpg",
 "isVertical": 0,
 "cate_id": "1",
 "room_name": "光老湿：中上吸血鬼详细教学",
 "show_status": "1",
 "subject": "",
 "show_time": "1483668698",
 "owner_uid": "9675450",
 "specific_catalog": "loveshiguang",
 "specific_status": "1",
 "vod_quality": "0",
 "nickname": "时光吸血鬼",
 "online": 10537,
 "url": "/loveshiguang",
 "game_url": "/directory/game/LOL",
 "game_name": "英雄联盟",
 "child_id": "34",
 "avatar": "https://apic.douyucdn.cn/upload/avanew/face/201610/17/23/0670552871f39139832f95e85356671f_big.jpg",
 "avatar_mid": "https://apic.douyucdn.cn/upload/avanew/face/201610/17/23/0670552871f39139832f95e85356671f_middle.jpg",
 "avatar_small": "https://apic.douyucdn.cn/upload/avanew/face/201610/17/23/0670552871f39139832f95e85356671f_small.jpg",
 "jumpUrl": "",
 "fans": "64678",
 "ranktype": 2,
 "anchor_city": ""
 */
