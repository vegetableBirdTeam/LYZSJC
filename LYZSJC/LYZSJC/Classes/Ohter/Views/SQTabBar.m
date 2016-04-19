//
//  SQTabBar.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/15.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQTabBar.h"
#import "SQAddViewController.h"

@interface SQTabBar ()

/** 发布按钮 */
@property (nonatomic, strong) UIButton *publishBtn;

@end

@implementation SQTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 设置tabBar的背景图
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        _publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [self.publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self.publishBtn addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.publishBtn];
        self.publishBtn.size = self.publishBtn.currentBackgroundImage.size;
    }
    return self;
}

- (void)publishClick {
    SQAddViewController *addVC = [[SQAddViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:addVC];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navi animated:NO completion:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    // 设置发布按钮的frame
    self.publishBtn.center = CGPointMake(width / 2, height / 2);
    
    // 自定义UITabBarButton的frame
    CGFloat buttonY = 0;
    CGFloat buttonW = width / 5.0;
    CGFloat buttonH = height;
    NSInteger index = 0;
    // 设置其他UITabBarButton的frame
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:[UIControl class]] || button == self.publishBtn) continue;
        CGFloat buttonX = buttonW * ((index > 1) ? (index + 1) : index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 增加索引
        index++;
    }
}

@end
