//
//  JLKUserInfoView.h
//  LYZSJC
//
//  Created by zero on 16/4/22.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLKUserInfo.h"

@interface JLKUserInfoView : UIView

/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/** 用户昵称 */
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
/** 关注按钮 */
@property (weak, nonatomic) IBOutlet UIButton *focusButton;
/** 收藏按钮 */
@property (weak, nonatomic) IBOutlet UIButton *collectButton;
/** 粉丝按钮 */
@property (weak, nonatomic) IBOutlet UIButton *fansButton;

/** 模型 */
@property (nonatomic, strong) JLKUserInfo *userinfo;

@end
