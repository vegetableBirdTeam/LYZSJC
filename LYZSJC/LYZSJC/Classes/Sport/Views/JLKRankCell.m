//
//  JLKRankCell.m
//  LYZSJC
//
//  Created by zero on 16/4/20.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import "JLKRankCell.h"

@implementation JLKRankCell

- (instancetype)init
{
    if (self = [super init]) {
        self.rankLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_rankLabel];
        
        self.iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageView];
        
        self.usernameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_usernameLabel];
    }
    return self;
}

- (void)setModel:(JLKRankModel *)model
{
    self.rankLabel.text = [NSString stringWithFormat:@"%ld", self.rank];
    if (_rank == 0) {
        self.rankLabel.font = [UIFont boldSystemFontOfSize:30];
    } else if (_rank == 1) {
        self.rankLabel.font = [UIFont boldSystemFontOfSize:25];
    } else if (_rank == 2) {
        self.rankLabel.font = [UIFont boldSystemFontOfSize:20];
    }
    
    NSURL *url = [NSURL URLWithString:model.iconUrl];
    [self.iconImageView sd_setImageWithURL:url];
    
    self.usernameLabel.text = model.username;
    self.usernameLabel.font = _rankLabel.font;
}

- (void)layoutSubviews
{
    [self layoutWithRank:_rank];
    
    _rankLabel.x = 10;
    _rankLabel.y = 10;
    
    _iconImageView.x = 20 + _rankLabel.width;
    _iconImageView.y = 10;
    _iconImageView.layer.cornerRadius = _iconImageView.width / 2;
    
    _usernameLabel.x = 30 + _iconImageView.x + _iconImageView.width;
    _usernameLabel.y = 10;
    
}

- (CGFloat)autoHeightWithRank:(NSInteger)rank
{
    [self layoutWithRank:rank];
    
    return _usernameLabel.height + 20;
}

+ (CGFloat)autoHeightWithRank:(NSInteger)rank
{
    JLKRankCell *cell = [[JLKRankCell alloc] init];
    return [cell autoHeightWithRank:rank];
}

- (void)layoutWithRank:(NSInteger)rank
{
    CGFloat first = 100;
    CGFloat second = 80;
    CGFloat third = 60;
    CGFloat other = 50;
    if (rank == 0) {
        _rankLabel.width = first;
        _rankLabel.height = first;
        _iconImageView.width = first;
        _iconImageView.height = first;
        _usernameLabel.width = first;
        _usernameLabel.height = first;
    } else if (rank == 1) {
        _rankLabel.width = second;
        _usernameLabel.height = second;
        _usernameLabel.width = second;
        _rankLabel.height = second;
        _iconImageView.width = second;
        _iconImageView.height = second;
    } else if (rank == 2) {
        _usernameLabel.width = third;
        _usernameLabel.height = third;
        _rankLabel.width = third;
        _rankLabel.height = third;
        _iconImageView.width = third;
        _iconImageView.height = third;
    } else {
        _usernameLabel.width = other;
        _usernameLabel.height = other;
        _rankLabel.width = other;
        _rankLabel.height = other;
        _iconImageView.width = other;
        _iconImageView.height = other;
    }
}

@end
