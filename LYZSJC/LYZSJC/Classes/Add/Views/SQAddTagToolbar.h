//
//  SQAddTagToolbar.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/21.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    /** 拍照 */
    SQAddTagToolbarButtonTypeCamera,
    /** 图片 */
    SQAddTagToolbarButtonTypePicture,
    /** @ */
    SQAddTagToolbarButtonTypeMention,
    /** # */
    SQAddTagToolbarButtonTypeTrend,
    SQAddTagToolbarButtonTypeEmotion
} SQAddTagToolbarButtonType;

@interface SQAddTagToolbar : UIView

@end
