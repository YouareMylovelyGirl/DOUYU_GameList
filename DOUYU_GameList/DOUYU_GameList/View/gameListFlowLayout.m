//
//  gameListFlowLayout.m
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "gameListFlowLayout.h"

@implementation gameListFlowLayout
- (instancetype)init
{
    if (self = [super init]) {
        CGFloat width = (long)(([UIScreen mainScreen].bounds.size.width - 2 * 20 - 2 * 20) / 3);
        CGFloat height = width + 25;
        self.itemSize = CGSizeMake(width, height);
        self.minimumLineSpacing = 20;
        self.minimumInteritemSpacing = 20;
        self.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    }
    return self;
}
@end
