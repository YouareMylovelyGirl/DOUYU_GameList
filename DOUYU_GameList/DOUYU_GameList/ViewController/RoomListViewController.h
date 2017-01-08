//
//  RoomListViewController.h
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/8.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gameListItem.h"
@interface RoomListViewController : UICollectionViewController
@property (nonatomic, strong) gameListDataItem *item;
- (instancetype)initWithGameItem:(gameListDataItem *)item;
@end
