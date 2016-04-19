//
//  YGJobTableViewCell.m
//  LYZSJC
//
//  Created by Lovecx on 16/4/18.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "YGJobTableViewCell.h"

@implementation YGJobTableViewCell

/**
 *  内边距
 */
- (void)setFrame:(CGRect)frame {
    frame.origin.x = SQTopicCellMargin;
    frame.size.width -= 2 * SQTopicCellMargin;
    frame.size.height -= SQTopicCellMargin;
    frame.origin.y += SQTopicCellMargin;
    
    [super setFrame:frame];
}

/**
 *  创建button
 */
- (void)createButtonWithbutton:(UIButton *)button image:(NSString *)image title:(NSString *)title {
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
}

- (void)setDataWithModel:(YGJobTableModel *)data {
    self.user_image.backgroundColor = [UIColor redColor];
    self.user_name.text = @"何必那么认真";
    self.commits.text = @"中国证券网讯 来自中国外汇交易中心的最新数据显示，4月18日人民币对美元汇率中间价报6.4787，较前一交易日(4月15日)中间价6.4908升值121点。";
    
    [self createButtonWithbutton:self.share_button image:@"分享" title:@"888"];
    [self createButtonWithbutton:self.commit_button image:@"评论" title:@"888"];
    [self createButtonWithbutton:self.like_button image:@"点赞" title:@"888"];
}

/**
 *  定义button的边框
 */
- (void)buttonLayer:(UIButton *)button {
    button.layer.borderWidth = 1.5;
    button.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor grayColor]);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self buttonLayer:self.share_button];
    [self buttonLayer:self.commit_button];
    [self buttonLayer:self.like_button];
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
