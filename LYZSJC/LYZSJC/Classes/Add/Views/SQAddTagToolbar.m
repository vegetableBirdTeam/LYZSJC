//
//  SQAddTagToolbar.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/21.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQAddTagToolbar.h"

@interface SQAddTagToolbar ()

@property (nonatomic, weak) UIButton *emotionBtn;

@end

@implementation SQAddTagToolbar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"compose_toolbar_background"]];
        
        // 初始化按钮
        [self addSubview:[self setupBtn:@"compose_toolbar_picture" highImage:@"compose_toolbar_picture_highlighted" type:SQAddTagToolbarButtonTypePicture]];
        
        [self addSubview:[self setupBtn:@"compose_mentionbutton_background" highImage:@"compose_mentionbutton_background_highlighted" type:SQAddTagToolbarButtonTypeMention]];
        
        UIButton *emotionBtn = [self setupBtn:@"compose_emoticonbutton_background" highImage:@"compose_emoticonbutton_background_highlighted" type:SQAddTagToolbarButtonTypeEmotion];
        [self addSubview:emotionBtn];
        self.emotionBtn = emotionBtn;
    }
    return self;
}

/**
 * 创建一个按钮
 */
- (UIButton *)setupBtn:(NSString *)image highImage:(NSString *)highImage type:(SQAddTagToolbarButtonType)type

{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = type;
    [self addSubview:btn];
    return btn;
}

/**
 *  按钮点击方法
 */
- (void)btnClick:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(addTagToolbar:didClickButton:)]) {
        [self.delegate addTagToolbar:self didClickButton:(int)button.tag];
    }
}

- (void)setShowKeyboardButton:(BOOL)showKeyboardButton {
    _showKeyboardButton = showKeyboardButton;
    
    // 默认的图片名
    NSString *image = @"compose_emoticonbutton_background";
    NSString *highImage = @"compose_emoticonbutton_background_highlighted";
    
    // 显示键盘图标
    if (showKeyboardButton) {
        image = @"compose_keyboardbutton_background";
        highImage = @"compose_keyboardbutton_background_highlighted";
    }
    
    // 设置图片
    [self.emotionBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self.emotionBtn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置所有按钮的frame
    CGFloat btnW = self.width / 5.0;
    CGFloat btnH = self.height;
    for (NSUInteger i = 0; i < 3; i++) {
        UIButton *btn = self.subviews[i];
        btn.y = 0;
        btn.width = btnW;
        if (i == 2) {
            i += 2;
        }
        btn.x = i * btnW;
        btn.height = btnH;
    }
}

@end
