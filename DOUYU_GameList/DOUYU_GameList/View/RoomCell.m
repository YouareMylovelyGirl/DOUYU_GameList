//
//  RoomCell.m
//  DOUYU_GameList
//
//  Created by 阳光 on 2017/1/8.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "RoomCell.h"

@implementation RoomCell

/*
 @property (nonatomic, strong) UIImageView *iconIV;
 @property (nonatomic, strong) UIView *showView;
 @property (nonatomic, strong) UILabel *leftLabel;
 @property (nonatomic, strong) UILabel *rightLabel;
 @property (nonatomic, strong) UILabel *bottomLabel;
 */

- (UIImageView *)iconIV
{
    if (_iconIV == nil) {
        _iconIV = [UIImageView new];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.height.mas_equalTo(100);
        }];
        _iconIV.layer.cornerRadius = 5;
        _iconIV.layer.masksToBounds = YES;
    }
    return _iconIV;
}

- (UIView *)showView
{
    if (_showView == nil) {
        _showView = [UIView new];
        _showView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        [self.iconIV addSubview:_showView];
        [_showView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
        
    }
    return _showView;
}

- (UILabel *)leftLabel
{
    if (_leftLabel == nil) {
        _leftLabel = [UILabel new];
        _leftLabel.textColor = [UIColor whiteColor];
//        _leftLabel.preferredMaxLayoutWidth = 70.0;
        [self.showView addSubview:_leftLabel];
        [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.mas_equalTo(0);
            make.right.mas_equalTo(self.showView).offset(-40);
        }];
        _leftLabel.font = [UIFont systemFontOfSize:11];
        _leftLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _leftLabel;
}

- (UILabel *)rightLabel
{
    if (_rightLabel == nil) {
        _rightLabel = [UILabel new];
        _rightLabel.textColor = [UIColor whiteColor];
        [self.showView addSubview:_rightLabel];
        [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
        }];
        _rightLabel.font = [UIFont systemFontOfSize:11];
        _rightLabel.textAlignment = NSTextAlignmentRight;
    }
    return _rightLabel;
}

- (UILabel *)bottomLabel
{
    if (_bottomLabel == nil) {
        _bottomLabel = [UILabel new];
        [self.contentView addSubview:_bottomLabel];
        [_bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
        }];
        _bottomLabel.font = [UIFont systemFontOfSize:14];
    }
    return _bottomLabel;
}

@end
