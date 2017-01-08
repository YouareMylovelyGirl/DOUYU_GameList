//
//  NetManager.m
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
+ (id)getGameListItemCompletionHandler:(void (^)(gameListItem *, NSError *))completionHandler
{
    NSString *path = @"http://www.douyutv.com/api/v1/game?client_sys=ios&aid=ios&time=1427694374&auth=a7f87aa94fa4d2cc1b549ba9389533e8";
    return [self get:path completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([gameListItem parse:obj], error);
    }];
}


+ (id)getRoomItemWithCate_id:(NSString *)cate_id offset:(NSInteger)offset CompletionHandler:(void(^)(RoomItem *roomItem, NSError *error))completionHandler;
{
    
    NSString *path = [NSString stringWithFormat:@"http://www.douyutv.com/api/v1/live/%@?offset=%ld&limit=20",cate_id,offset];
    return [self get:path completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([RoomItem parse:obj], error);
    }];
}
@end
