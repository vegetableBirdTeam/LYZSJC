//
//  SQDropdwomView.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/19.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQDropdownView;

@protocol SQDropdownViewDelegate <NSObject>

@optional
- (void)dropdownMenuDidDismiss:(SQDropdownView *)menu;
- (void)dropdownMenuDidSHow:(SQDropdownView *)menu;

@end

@interface SQDropdownView : UIView

/** 初始化 */
+ (instancetype)menu;

/** 显示 */
- (void)showFrom:(UIView *)from;

/** 销毁 */
- (void)dismiss;

/** 内容 */
@property (nonatomic, strong) UIView *contentView;

/** 内容控制器 */
@property (nonatomic, strong) UIViewController *contentController;

/** 代理 */
@property (nonatomic, weak) id<SQDropdownViewDelegate> delegate;

@end
