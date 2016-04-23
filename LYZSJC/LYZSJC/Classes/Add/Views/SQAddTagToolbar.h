//
//  SQAddTagToolbar.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/21.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQAddTagToolbar;

@protocol SQAddTagToolbarDelegate <NSObject>

@optional
- (void)addTagToolbar:(SQAddTagToolbar *)toolbar didClickButton:(SQAddTagToolbarButtonType)type;

@end

@interface SQAddTagToolbar : UIView

/** 是否要显示键盘按钮 */
@property (nonatomic, assign) BOOL showKeyboardButton;
/** 代理 */
@property (nonatomic, weak) id<SQAddTagToolbarDelegate> delegate;

@end
