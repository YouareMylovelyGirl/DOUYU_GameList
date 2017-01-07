//
//  NSObject+parse.h
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (parse)
+ (id)parse:(id)JSON;
//属性中有数组的情况下调用
+ (NSDictionary *)objectInArray;
//属性中有关键次的情况下调用
+ (NSDictionary *)propertyMapper;
@end
