//
//  UIView+SQCustom.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/15.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SQCustom)

/** x值 */
@property (nonatomic, assign) CGFloat x;
/** y值 */
@property (nonatomic, assign) CGFloat y;
/** 宽度 */
@property (nonatomic, assign) CGFloat width;
/** 高度 */
@property (nonatomic, assign) CGFloat height;
/** 尺寸 */
@property (nonatomic, assign) CGSize size;
/** 中心x */
@property (nonatomic, assign) CGFloat centerX;
/** 中心y */
@property (nonatomic, assign) CGFloat centerY;

/** 在分类中声明@property，只会生成方法的声明，不会生成方法的实现和带有_(下划线)的成员变量 */

/**
  * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)isShowingOnKeyWindow;

@end
