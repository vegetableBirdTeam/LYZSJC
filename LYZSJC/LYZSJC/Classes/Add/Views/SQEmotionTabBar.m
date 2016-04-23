//
//  SQQEmotionTabBar.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/22.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQEmotionTabBar.h"
#import "SQEmotionTabBarButton.h"

@interface SQEmotionTabBar ()

@property (nonatomic, weak) SQEmotionTabBarButton *selectedBtn;

@end

@implementation SQEmotionTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupBtn:@"最近" buttonType:SQEmotionTabBarButtonTypeRecent];
        [self setupBtn:@"默认" buttonType:SQEmotionTabBarButtonTypeDefault];
        [self setupBtn:@"Emoji" buttonType:SQEmotionTabBarButtonTypeEmoji];
        [self setupBtn:@"浪小花" buttonType:SQEmotionTabBarButtonTypeLxh];
    }
    return self;
}

/**
 *  创建一个按钮
 */
- (SQEmotionTabBarButton *)setupBtn:(NSString *)title buttonType:(SQEmotionTabBarButtonType)type {
    
    SQEmotionTabBarButton *btn = [[SQEmotionTabBarButton alloc]init];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    btn.tag = type;
    [btn setTitle:title forState:UIControlStateNormal];
    [self addSubview:btn];
    
    
    if (type == SQEmotionTabBarButtonTypeDefault) {
        [self btnClick:btn];
    }
    
    // 设置背景图片
    NSString *image = @"compose_emotion_table_mid_normal";
    NSString *selectImage = @"compose_emotion_table_mid_selected";
    if (self.subviews.count == 1) {
        image = @"compose_emotion_table_left_normal";
        selectImage = @"compose_emotion_table_left_selected";
    } else if (self.subviews.count == 4) {
        image = @"compose_emotion_table_right_normal";
        selectImage = @"compose_emotion_table_right_selected";
    }
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selectImage] forState:UIControlStateDisabled];
    
    return btn;
}

/**
 *  重写代理方法
 */
- (void)setDelegate:(id<SQEmotionTabBarDelegate>)delegate {
    _delegate = delegate;
    
    // 选中默认按钮
    [self btnClick:(SQEmotionTabBarButton *)[self viewWithTag:SQEmotionTabBarButtonTypeDefault]];;
}

/**
 *  按钮点击方法
 */
- (void)btnClick:(SQEmotionTabBarButton *)button {
    self.selectedBtn.enabled = YES;
    button.enabled = NO;
    self.selectedBtn = button;
    
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(emotionTabBar:didSelectButton:)]) {
        [self.delegate emotionTabBar:self didSelectButton:(int)button.tag];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置按钮的frame
    NSUInteger btnCount = self.subviews.count;
    CGFloat btnW = self.width / btnCount;
    CGFloat btnH = self.height;
    for (int i = 0; i < btnCount; i++) {
        SQEmotionTabBarButton *btn = self.subviews[i];
        btn.y = 0;
        btn.width = btnW;
        btn.x = i * btnW;
        btn.height = btnH;
    }
}

@end
