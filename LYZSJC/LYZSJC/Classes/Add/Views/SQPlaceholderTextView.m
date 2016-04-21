//
//  SQPlaceholderTextView.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/21.
//  Copyright © 2016年 SQ. All rights reserved.
//  拥有占位文字功能的textView

#import "SQPlaceholderTextView.h"

@interface SQPlaceholderTextView ()

/** 占位文字label */
@property (nonatomic, weak) UILabel *placeholderLabel;

@end

@implementation SQPlaceholderTextView

- (UILabel *)placeholderLabel {
    if (!_placeholderLabel) {
        // 添加一个用来显示占位文字的label
        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.x = 4;
        placeholderLabel.y = 7;
        [self addSubview:placeholderLabel];
        _placeholderLabel = placeholderLabel;
    }
    return _placeholderLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 垂直方向上永远有弹簧效果
        self.alwaysBounceVertical = YES;
        
        // 默认字体
        self.font = [UIFont systemFontOfSize:15.0];
        
        // 默认的占位文字颜色
        self.placeholderColor = [UIColor grayColor];
        
        // 监听文字改变
        [SQNotificationCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

/**
 *  内存管理
 */
- (void)dealloc {
    [SQNotificationCenter removeObserver:self];
}

/**
 *  监听文字改变
 */
- (void)textDidChange {
    // 只要有文字，就隐藏占位文字label
    self.placeholderLabel.hidden = self.hasText;
}

/**
 *  更新占位文字的尺寸
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.placeholderLabel.width = self.width - 2 * self.placeholderLabel.x;
    [self.placeholderLabel sizeToFit];
}

#pragma mark -重写setter
/**
 *  setNeedsDisplay方法 : 会在恰当的时刻自动调用drawRect:方法
 *  setNeedsLayout方法  : 会在恰当的时刻调用layoutSubviews方法
 */
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = [placeholder copy];
    self.placeholderLabel.text = placeholder;
    [self setNeedsLayout];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeholderLabel.font = font;
    [self setNeedsLayout];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    
    [self textDidChange];
}

@end
