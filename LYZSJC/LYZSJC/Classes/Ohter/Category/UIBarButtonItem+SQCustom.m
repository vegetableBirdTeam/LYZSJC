//
//  UIBarButtonItem+SQCustom.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/15.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "UIBarButtonItem+SQCustom.h"

@implementation UIBarButtonItem (SQCustom)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

@end
