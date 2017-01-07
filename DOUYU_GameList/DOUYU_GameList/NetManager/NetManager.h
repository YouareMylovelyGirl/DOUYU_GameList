//
//  NetManager.h
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "BaseNetManager.h"
#import "gameListItem.h"

@interface NetManager : BaseNetManager
+ (id)getGameListItemCompletionHandler:(void(^)(gameListDataItem *gameLists, NSError *error))completionHandler;
@end
