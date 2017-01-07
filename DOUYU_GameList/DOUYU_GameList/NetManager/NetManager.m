//
//  NetManager.m
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
+ (id)getGameListItemCompletionHandler:(void (^)(gameListDataItem *, NSError *))completionHandler
{
    NSString *path = @"http://www.douyutv.com/api/v1/game?client_sys=ios&aid=ios&time=1427694374&auth=a7f87aa94fa4d2cc1b549ba9389533e8";
    return [self get:path completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([gameListDataItem parse:obj], error);
    }];
}
@end
