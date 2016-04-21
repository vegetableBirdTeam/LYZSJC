//
//  SQPlaceholderTextView.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/21.
//  Copyright © 2016年 SQ. All rights reserved.
//  拥有占位文字功能的textView

#import <UIKit/UIKit.h>

@interface SQPlaceholderTextView : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字的颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end
