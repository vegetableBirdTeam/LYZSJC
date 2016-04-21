//
//  JLKRankCell.m
//  LYZSJC
//
//  Created by zero on 16/4/20.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import "JLKRankCell.h"

@implementation JLKRankCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.rankLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_rankLabel];
        
        self.iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageView];
        
        self.usernameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_usernameLabel];
        
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setModel:(JLKRankModel *)model
{
    self.rankLabel.text = [NSString stringWithFormat:@"%ld", self.rank + 1];
    self.rankLabel.textAlignment = NSTextAlignmentLeft;
    self.rankLabel.font = [UIFont boldSystemFontOfSize:20];
    
    NSURL *url = [NSURL URLWithString:model.iconUrl];
    [self.iconImageView sd_setImageWithURL:url];
    
    self.usernameLabel.text = model.username;
    self.usernameLabel.font = _rankLabel.font;
    self.usernameLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
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
    CGFloat third = 70;
    CGFloat other = 60;
    
    if (rank == 0) {
        _rankLabel.textColor = [UIColor redColor];
        _usernameLabel.textColor = [UIColor redColor];
        
        _rankLabel.width = first / 2;
        _rankLabel.height = first;
        _iconImageView.width = first;
        _iconImageView.height = first;
        _usernameLabel.width = SCREENW - first * 3 / 2 - 40;
        _usernameLabel.height = first;
    } else if (rank == 1) {
        _rankLabel.textColor = [UIColor yellowColor];
        _usernameLabel.textColor = [UIColor yellowColor];
        
        _rankLabel.width = second / 2;
        _rankLabel.height = second;
        _iconImageView.width = second;
        _iconImageView.height = second;
        _usernameLabel.width = SCREENW - second * 3 / 2 - 40;
        _usernameLabel.height = second;
    } else if (rank == 2) {
        _rankLabel.textColor = [UIColor blueColor];
        _usernameLabel.textColor = [UIColor blueColor];
        
        _rankLabel.width = third / 2;
        _rankLabel.height = third;
        _iconImageView.width = third;
        _iconImageView.height = third;
        _usernameLabel.width = SCREENW - third * 3 / 2 - 40;
        _usernameLabel.height = third;
    } else {
        _rankLabel.textColor = [UIColor blackColor];
        _usernameLabel.textColor = [UIColor blackColor];
        
        _rankLabel.width = other / 2;
        _rankLabel.height = other;
        _iconImageView.width = other;
        _iconImageView.height = other;
        _usernameLabel.width = SCREENW - other * 3 / 2 - 40;
        _usernameLabel.height = other;
    }
}

@end
