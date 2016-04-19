//
//  SQAddView.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/15.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SQAddViewDelegate <NSObject>

/** 点击菜单栏的哪个按钮 */
- (void)didClickMenu:(int)index;

/** 关闭菜单 */
- (void)didCloseMenu;

@end

@interface SQAddView : UIView

/** 发文字 */
@property (nonatomic, strong) UIButton *textBtn;
/** 发图片 */
@property (nonatomic, strong) UIButton *photoBtn;
/** 发视频 */
@property (nonatomic, strong) UIButton *videoBtn;
/** 发链接 */
@property (nonatomic, strong) UIButton *linkBtn;
/** 发声音 */
@property (nonatomic, strong) UIButton *voiceBtn;
/** 敬请期待 */
@property (nonatomic, strong) UIButton *button;
/** 背景 */
@property (nonatomic, strong) UIView *backgroundView;
/** 返回 */
@property (nonatomic, strong) UIButton *backBtn;
/** 代理方法 */
@property (nonatomic, assign) id<SQAddViewDelegate> delegate;

/** 显示菜单栏 */
- (void)showMenuView;

@end
