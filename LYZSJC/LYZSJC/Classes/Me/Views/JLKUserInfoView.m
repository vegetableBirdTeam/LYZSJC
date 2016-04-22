//
//  JLKUserInfoView.m
//  LYZSJC
//
//  Created by zero on 16/4/22.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import "JLKUserInfoView.h"

@implementation JLKUserInfoView

- (void)awakeFromNib
{
    
}

- (void)setUserinfo:(JLKUserInfo *)userinfo
{
    NSURL *url = [NSURL URLWithString:userinfo.iconUrl];
    [_iconImageView sd_setImageWithURL:url];
    self.iconImageView.layer.cornerRadius = _iconImageView.size.width / 2;
    
    _usernameLabel.text = userinfo.username;
    
    [_focusButton setTitle:[NSString stringWithFormat:@"关注 %@", userinfo.focusCnt] forState:UIControlStateNormal];
    [_focusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [_collectButton setTitle:[NSString stringWithFormat:@"收藏 %@", userinfo.collectCnt] forState:UIControlStateNormal];
    [_collectButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [_fansButton setTitle:[NSString stringWithFormat:@"粉丝 %@", userinfo.fansCnt] forState:UIControlStateNormal];
    [_fansButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

/**
 *  关注按钮点击
 */
- (IBAction)focusBtnClick:(UIButton *)sender {
    
}

/**
 *  收藏按钮点击
 */
- (IBAction)collectBtnClick:(UIButton *)sender {
    
}

/**
 *  粉丝按钮点击
 */
- (IBAction)fansBtnClick:(UIButton *)sender {
    
}

@end
