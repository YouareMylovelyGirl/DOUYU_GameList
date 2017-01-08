//
//  NetManager.h
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "BaseNetManager.h"
#import "gameListItem.h"
#import "RoomItem.h"

@interface NetManager : BaseNetManager
+ (id)getGameListItemCompletionHandler:(void(^)(gameListItem *gameLists, NSError *error))completionHandler;


+ (id)getRoomItemWithCate_id:(NSString *)cate_id offset:(NSInteger)offset CompletionHandler:(void(^)(RoomItem *roomItem, NSError *error))completionHandler;
@end
