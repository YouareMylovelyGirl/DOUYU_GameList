//
//  NSObject+parse.m
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "NSObject+parse.h"

@implementation NSObject (parse)

+ (instancetype)parseDict:(NSDictionary *)dict
{
    id item = [self new];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *keyPro = [self propertyMapper][key];
        if (keyPro) {
            key = keyPro;
        }
        NSString *keyClass = [self objectInArray][key];
        if (keyClass) {
            Class class = NSClassFromString(keyClass);
            obj = [class parse:obj];
        }
        [item setValue:obj forKey:key];
    }];
    return item;
}


+ (instancetype)parseArr:(NSArray *)array
{
    NSMutableArray *tempArr = [NSMutableArray array];
    for (id obj in array) {
        [tempArr addObject:[self parse:obj]];
    }
    return tempArr.copy;
}

+ (id)parse:(id)JSON
{
    if ([JSON isKindOfClass:[NSArray class]]) {
        return [self parseArr:JSON];
    }
    if ([JSON isKindOfClass:[NSDictionary class]]) {
        return [self parseDict:JSON];
    }
    return JSON;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (void)setNilValueForKey:(NSString *)key
{
    
}


+ (NSDictionary *)objectInArray
{
    return nil;
}


+ (NSDictionary *)propertyMapper
{
    return nil;
}
@end
