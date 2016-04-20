//
//  JLKRankCell.h
//  LYZSJC
//
//  Created by zero on 16/4/20.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLKRankModel.h"

@interface JLKRankCell : UITableViewCell

/** 判断排名 */
@property (nonatomic, assign) NSInteger rank;

/** 用户排名 */
@property (nonatomic, strong) UILabel *rankLabel;
/** 头像 */
@property (nonatomic, strong) UIImageView *iconImageView;
/** 用户昵称 */
@property (nonatomic, strong) UILabel *usernameLabel;

/** 模型 */
@property (nonatomic, strong) JLKRankModel *model;

/** 计算高度 */
+ (CGFloat)autoHeightWithRank:(NSInteger)rank;

@end
