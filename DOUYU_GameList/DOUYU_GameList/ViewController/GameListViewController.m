//
//  GameListViewController.m
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "GameListViewController.h"
#import "NetManager.h"
#import "gameListItem.h"
#import "GameCell.h"
#import "RoomListViewController.h"
@interface GameListViewController ()
/** 数据数组 */
@property(nonatomic,strong)NSArray *dataArr;

@end

@implementation GameListViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNaviUI];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getGameListItemCompletionHandler:^(gameListItem *gameLists, NSError *error) {
            [self.collectionView.mj_header endRefreshing];
            if (!error) {
                [self.collectionView reloadData];
                self.dataArr = gameLists.data;
            }
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    
    // Register cell classes
    [self.collectionView registerClass:[GameCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)configNaviUI
{
    self.navigationItem.title = @"斗鱼直播";
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.tintColor = [UIColor purpleColor];
    self.navigationController.navigationBar.translucent = NO; // 决定view的位置
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:25];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:12 forBarMetrics:UIBarMetricsDefault];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    GameCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    gameListDataItem *item = self.dataArr[indexPath.row];
    [cell.iconIV sd_setImageWithURL:[NSURL URLWithString:item.game_icon]];
    cell.nameLb.text = item.game_name;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    RoomListViewController *roomList = [[RoomListViewController alloc]initWithGameItem:self.dataArr[indexPath.row]];
    [self.navigationController pushViewController:roomList animated:YES];
}





@end
