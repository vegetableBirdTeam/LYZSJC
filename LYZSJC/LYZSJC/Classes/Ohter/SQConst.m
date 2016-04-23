//
//  SQConst.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/18.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 运动-所有顶部标题高度 */
CGFloat const SQTitlesViewH = 35;
/** 运动-所有顶部标题宽度 */
CGFloat const SQTitlesViewY = 64;
/** 运动-所有显示步数控件高度 */
CGFloat const JLKStepViewH = 64;

/** 精华-cell-间距 */
CGFloat const SQTopicCellMargin = 10;
/** 精华-cell-文字内容的y值 */
CGFloat const SQTopicCellTextY = 55;
/** 精华-cell-底部工具条的高度 */
CGFloat const SQTopicCellBottomBarH = 44;

/** 精华-cell-图片帖子的最大高度 */
CGFloat const SQTopicCellPictureMaxH = 1000;
/** 精华-cell-图片帖子一旦超过最大高度，就是用break */
CGFloat const SQTopicCellPictureBreakH = 250;

/** SQUser模型-性别属性值 */
NSString * const SQUserSexMale = @"m";
NSString * const SQUserSexFemale = @"f";

/** 精华-cell-最热评论标题的高度 */
CGFloat const SQTopicCellTopCmtTitleH = 20;



/********  表情键盘  **********/
/** 一页中最多3行 */
int SQEmotionMaxRows = 3;
/** 一行中最多7列 */
int SQEmotionMaxCols = 7;