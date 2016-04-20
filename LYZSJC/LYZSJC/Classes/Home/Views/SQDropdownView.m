//
//  SQDropdwomView.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/19.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQDropdownView.h"

@interface SQDropdownView ()

/** 将来用来显示具体内容的容器 */
@property (nonatomic, weak) UIImageView *containerView;

@end

@implementation SQDropdownView

/**
 *  懒加载
 */
- (UIImageView *)containerView {
    if (!_containerView) {
        // 添加一个灰色图片控件
        UIImageView *containerView = [[UIImageView alloc] init];
        containerView.image = [UIImage imageNamed:@"popover_background"];
        containerView.width = 180;
        containerView.height = 217;
        
        // 开启交互
        containerView.userInteractionEnabled = YES;
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return _containerView;
}

/**
 *  初始化
 */
+ (instancetype)menu {
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 清除颜色
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

/** 显示 */
- (void)showFrom:(UIView *)from {
    // 获取最上面的窗口
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    
    // 添加自己到窗口上
    [window addSubview:self];
    
    // 设置尺寸
    self.frame = window.bounds;
    
    // 调整灰色图片的位置
    // 默认状况下，frame是以父控件左上角为坐标原点
    // 转换坐标系
    CGRect newFrame = [from.superview convertRect:from.frame toView:window];
    self.containerView.centerX = CGRectGetMidX(newFrame);
    self.containerView.y = CGRectGetMaxY(newFrame);
    
    // 通知外界，自己显示了
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidSHow:)]) {
        [self.delegate dropdownMenuDidSHow:self];
    }
}

/** 销毁 */
- (void)dismiss {
    // 移除控件
    [self removeFromSuperview];
    
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)]) {
        [self.delegate dropdownMenuDidDismiss:self];
    }
}

- (void)setContentView:(UIView *)contentView {
    _contentView = contentView;
    
    // 调整内容的位置
    contentView.x = 10;
    contentView.y = 15;
    
    // 调整内容宽度
    contentView.width = self.containerView.width - 2 * contentView.x;
    
    // 设置灰色的高度
    self.containerView.height = CGRectGetMaxY(contentView.frame) + 10;
    
    // 添加内容到灰色图片中
    [self.containerView addSubview:contentView];
}

- (void)setContentController:(UIViewController *)contentController {
    _contentController = contentController;
    self.contentView = contentController.view;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismiss];
}

@end
