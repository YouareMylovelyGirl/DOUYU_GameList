//
//  BaseNetManager.m
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "BaseNetManager.h"

@implementation BaseNetManager
+ (id)get:(NSString *)path completionHandler:(void (^)(id, NSError *))completionHandler
{
    NSURL *url = [NSURL URLWithString:path];
    NSOperationQueue *currentQueue = [NSOperationQueue currentQueue];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [currentQueue addOperationWithBlock:^{
            if (error) {
                !completionHandler ?: completionHandler(nil, error);
                return ;
            }
            NSError *err = nil;
            id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:&err];
            if (err) {
                !completionHandler ?: completionHandler(nil, err);
            }
            else
            {
                !completionHandler ?: completionHandler(obj, nil);
            }
            
        }];
    }];
    [dataTask resume];
    return dataTask;

}
@end
