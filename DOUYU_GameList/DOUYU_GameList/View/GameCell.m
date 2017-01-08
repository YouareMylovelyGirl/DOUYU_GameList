//
//  GameCell.m
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/8.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "GameCell.h"

@implementation GameCell
- (UIImageView *)iconIV{
    if (_iconIV == nil) {
        _iconIV = [[UIImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(_iconIV.mas_width);
            make.top.left.right.mas_equalTo(0);
        }];
        _iconIV.layer.cornerRadius = 5;
        _iconIV.layer.masksToBounds = YES;
    }
    return _iconIV;
}

- (UILabel *)nameLb
{
    if (_nameLb == nil) {
        _nameLb = [UILabel new];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-5);
            make.left.right.mas_equalTo(0);
        }];
        _nameLb.textAlignment = NSTextAlignmentCenter;
        _nameLb.font = [UIFont systemFontOfSize:15];
    }
    [self orangeView];
    return _nameLb;
}

- (UIView *)orangeView
{
    if (_orangeView == nil) {
        _orangeView = [[UIView alloc] init];
        _orangeView.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_orangeView];
        [_orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(2);
        }];
    }
    return _orangeView;
}

@end
