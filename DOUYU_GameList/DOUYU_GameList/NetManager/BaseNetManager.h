//
//  BaseNetManager.h
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetManager : NSObject
+ (id)get:(NSString *)path completionHandler:(void(^)(id obj, NSError *error))completionHandler;
@end
