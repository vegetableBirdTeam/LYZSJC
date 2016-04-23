//
//  SQEmotionPageView.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/22.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQEmotionPageView.h"
#import "SQEmotion.h"
#import "SQEmotionButton.h"
#import "SQEmotionTool.h"

@interface SQEmotionPageView ()

/** 删除按钮 */
@property (nonatomic, weak) UIButton *deleteButton;

@end

@implementation SQEmotionPageView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIButton *deleteButton = [[UIButton alloc] init];
        [deleteButton setImage:[UIImage imageNamed:@"compose_emotion_delete"] forState:UIControlStateNormal];
        [deleteButton setImage:[UIImage imageNamed:@"compose_emotion_delete_highlighted"] forState:UIControlStateHighlighted];
        [deleteButton addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:deleteButton];
        self.deleteButton = deleteButton;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 内边距
    CGFloat inset = 15;
    
    NSUInteger count = self.emotions.count;
    CGFloat buttonWidth = (self.width - 2 * inset) / SQEmotionMaxCols;
    CGFloat buttonHeight = (self.height - inset) / SQEmotionMaxRows;
    
    for (int i = 0; i < count; i++) {
        UIButton *button = self.subviews[i + 1];
        button.width = buttonWidth;
        button.height = buttonHeight;
        button.x = inset + (i % SQEmotionMaxCols) * buttonWidth;
        button.y = inset + (i / SQEmotionMaxCols) * buttonHeight;
    }
    
    // 删除按钮
    self.deleteButton.width = buttonWidth - 10;
    self.deleteButton.height = buttonHeight - 36;
    self.deleteButton.x = self.width - inset - buttonWidth + 5;
    self.deleteButton.y = self.height - buttonHeight + 18;
    
}

- (void)setEmotions:(NSArray *)emotions {
    _emotions = emotions;
    
    for (int i = 0; i < emotions.count; i++) {
        SQEmotionButton *button = [[SQEmotionButton alloc] init];
        [self addSubview:button];
        // 设置表情数据
        button.emotion = emotions[i];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

// 监听按钮的点击事件
- (void)deleteClick
{
    [SQNotificationCenter postNotificationName:@"EmotionDidDeleteNotification" object:nil];
}

// 表情按钮点击事件
- (void)buttonClick:(SQEmotionButton *)button
{
    [self selectEmotion:button.emotion];
}

// 选中某个表情，发出通知
- (void)selectEmotion:(SQEmotion *)emotion
{
    // 将这个表情存入沙盒
    [SQEmotionTool addRecentEmotion:emotion];
    
    // 发出通知
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[@"SelectEmotionKey"] = emotion;
    [SQNotificationCenter postNotificationName:@"EmotionDidSelectNotification" object:nil userInfo:userInfo];
}

@end
