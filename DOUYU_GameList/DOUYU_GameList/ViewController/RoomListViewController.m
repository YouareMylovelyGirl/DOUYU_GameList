//
//  RoomListViewController.m
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/8.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "RoomListViewController.h"
#import "RoomCell.h"
#import "NetManager.h"
#import "RoomItem.h"
@interface RoomListViewController ()
@property (nonatomic, strong) NSArray *rooms;
//可变数组,用于存放每次网络请求后获取的数据中的打他数组中的数据
@property (nonatomic, strong) NSMutableArray<RoomDataItem *> *roomList;
@end

@implementation RoomListViewController

- (NSMutableArray<RoomDataItem *> *)roomList
{
    if (_roomList == nil) {
        _roomList = [NSMutableArray new];
    }
    return _roomList;
}

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)initWithGameItem:(gameListDataItem *)item
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat width = (long)(([UIScreen mainScreen].bounds.size.width - 60) / 2);
    CGFloat height = 120;
    layout.itemSize = CGSizeMake(width, height);
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 20;
    layout.sectionInset = UIEdgeInsetsMake(10, 20, 10, 20);
    if (self = [super initWithCollectionViewLayout:layout]) {
        self.item = item;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.item.game_name;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getRoomItemWithCate_id:self.item.cate_id offset:0 CompletionHandler:^(RoomItem *roomItem, NSError *error)  {
            [self.collectionView.mj_header endRefreshing];
            if (!error) {
                
                self.rooms = roomItem.data;
                [self.roomList removeAllObjects];
                [self.roomList addObjectsFromArray:roomItem.data];
                [self.collectionView reloadData];
                
                //判断是否有更多数据
                if (roomItem.data.count < 20) {
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
                else
                {
                    //重置为 有更多数据的状态
                    [self.collectionView.mj_footer resetNoMoreData];
                }
            }
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    [self.collectionView registerClass:[RoomCell class] forCellWithReuseIdentifier:reuseIdentifier];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBackLastVC)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    //脚步刷新的UI添加
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [NetManager getRoomItemWithCate_id:self.item.cate_id offset:self.roomList.count CompletionHandler:^(RoomItem *roomItem, NSError *error) {
            [self.collectionView.mj_footer endRefreshing];
            if (!error) {
                [self.roomList addObjectsFromArray:roomItem.data];
                [self.collectionView reloadData];
                
                //判断是否有更多数据
                if (roomItem.data.count < 20) {
                    [self.collectionView.mj_footer endRefreshingWithNoMoreData];
                }
            }
        }];
    }];
}

-(void)goBackLastVC
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.roomList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RoomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    RoomDataItem *dataItem = self.roomList[indexPath.row];
    [cell.iconIV sd_setImageWithURL:[NSURL URLWithString:dataItem.room_src]];
    cell.leftLabel.text = dataItem.nickname;
//    cell.leftLabel.text = @"啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
    NSString *number = [dataItem.online doubleValue] > 10000 ? [NSString stringWithFormat:@"%.1lf万",([dataItem.online integerValue] / 10000.0)] : [NSString stringWithFormat:@"%ld",[dataItem.online integerValue]];
//    cell.rightLabel.text = [NSString stringWithFormat:@"%.1lf万",([dataItem.online doubleValue] / 10000.0)];
    cell.rightLabel.text = number;
    cell.bottomLabel.text = dataItem.room_name;
                            
    return cell;
}


@end
