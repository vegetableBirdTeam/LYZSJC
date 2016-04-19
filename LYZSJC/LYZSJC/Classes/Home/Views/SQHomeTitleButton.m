//
//  SQHomeTitleButton.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/18.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQHomeTitleButton.h"

@implementation SQHomeTitleButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        [self setImage:[UIImage imageNamed:@"navArrowUp"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"navArrowDown"] forState:UIControlStateSelected];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 计算titleLabel的frame
    self.titleLabel.x = 0;
    
    // 计算iamgeView的frame
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 10;
}

/**
 *  计算文字的尺寸
 */
- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    
    // 只要修改文字，就让按钮重新计算自己的尺寸
    [self sizeToFit];
}

/**
 *  计算文字的尺寸
 */
- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    
    [self sizeToFit];
}

@end
