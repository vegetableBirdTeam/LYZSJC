//
//  SQSportCell.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/18.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLKSportModel.h"

@interface SQSportCell : UITableViewCell

/** 封面图片 */
@property (weak, nonatomic) IBOutlet UIImageView *cover_imgImageView; // 封面图片
/** 标题 */
@property (weak, nonatomic) IBOutlet UILabel *title_Label;
/** 简介 */
@property (weak, nonatomic) IBOutlet UILabel *sub_titleLabel;
/** 浏览次数 */
@property (weak, nonatomic) IBOutlet UILabel *view_cntLabel;

/** 模型 */
@property (nonatomic, strong) JLKSportModel *model;

@end
