//
//  SQEmotionTabBarButton.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/22.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQEmotionTabBarButton.h"

@implementation SQEmotionTabBarButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 设置文字颜色
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        
        // 设置字体
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        
        // 取消高亮状态
        self.adjustsImageWhenHighlighted =NO;
    }
    return self;
}

@end
