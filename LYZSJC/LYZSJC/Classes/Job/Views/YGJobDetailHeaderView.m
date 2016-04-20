//
//  YGJobDetailHeaderView.m
//  LYZSJC
//
//  Created by Lovecx on 16/4/19.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "YGJobDetailHeaderView.h"

#define kString @"     中国证券网讯 来自中国外汇交易中心的最新数据显示，4月18日人民币对美元汇率中间价报6.4787，较前一交易日(4月15日)中间价6.4908升值121点。4月18日凌晨2点，上海黄浦区东街37弄4号发生火灾，过火面积约100平方米。火已扑灭，4人遇难。当日下午6时许，上海市黄浦区人民政府互联网信息办公室公众号“上海黄浦”对本次火灾进行了通报。     中国证券网讯 来自中国外汇交易中心的最新数据显示，4月18日人民币对美元汇率中间价报6.4787，较前一交易日(4月15日)中间价6.4908升值121点。4月18日凌晨2点，上海黄浦区东街37弄4号发生火灾，过火面积约100平方米。火已扑灭，4人遇难。当日下午6时许，上海市黄浦区人民政府互联网信息办公室公众号“上海黄浦”对本次火灾进行了通报。"

@implementation YGJobDetailHeaderView


- (void)assignment {
    self.user_image.backgroundColor = [UIColor redColor];
    self.user_name.text = @"何必那么认真";
    self.time_label.text = @"2015-10-10 10:10:10";
    [self.like_button setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
    [self.like_button setTitle:@"888" forState:UIControlStateNormal];
    
    self.commits.text = kString;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
