//
//  SQConst.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/18.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SQTopicTypeAll = 1,
    SQTopicTypePicture = 10,
    SQTopicTypeWord = 29,
    SQTopicTypeVoice = 31,
    SQTopicTypeVideo = 41
} SQTopicType;

typedef enum {
    /** 跑步装备 */
    SQSportTypeEquip = 1,
    /** 提高训练 */
    SQSportTypeTrain,
    /** 跑步故事 */
    SQSportTypeStory
} SQSportType;

typedef enum {
    /** 最近 */
    SQEmotionTabBarButtonTypeRecent,
    /** 默认 */
    SQEmotionTabBarButtonTypeDefault, 
    /** emoji */
    SQEmotionTabBarButtonTypeEmoji,
    /** 浪小花 */
    SQEmotionTabBarButtonTypeLxh,
    
} SQEmotionTabBarButtonType;

typedef enum {
    /** 图片 */
    SQAddTagToolbarButtonTypePicture,
    /** @ */
    SQAddTagToolbarButtonTypeMention,
    /** 表情 */
    SQAddTagToolbarButtonTypeEmotion
} SQAddTagToolbarButtonType;



/** 精华-所有顶部标题高度 */
UIKIT_EXTERN CGFloat const SQTitlesViewH;
/** 精华-所有顶部标题宽度 */
UIKIT_EXTERN CGFloat const SQTitlesViewY;
/** 运动-所有显示步数控件高度 */
UIKIT_EXTERN CGFloat const JLKStepViewH;

/** 精华-cell-间距 */
UIKIT_EXTERN CGFloat const SQTopicCellMargin;
/** 精华-cell-文字内容的y值 */
UIKIT_EXTERN CGFloat const SQTopicCellTextY;
/** 精华-cell-底部工具条的高度 */
UIKIT_EXTERN CGFloat const SQTopicCellBottomBarH;

/** 精华-cell-图片帖子的最大高度 */
UIKIT_EXTERN CGFloat const SQTopicCellPictureMaxH;
/** 精华-cell-图片帖子一旦超过最大高度，就是用break */
UIKIT_EXTERN CGFloat const SQTopicCellPictureBreakH;

/** SQUser模型-性别属性值 */
UIKIT_EXTERN NSString * const SQUserSexMale;
UIKIT_EXTERN NSString * const SQUserSexFemale;

/** 精华-cell-最热评论标题的高度 */
UIKIT_EXTERN CGFloat const SQTopicCellTopCmtTitleH;


/********  表情键盘  **********/
/** 一页中最多3行 */
UIKIT_EXTERN int SQEmotionMaxRows;
/** 一行中最多7列 */
UIKIT_EXTERN int SQEmotionMaxCols;