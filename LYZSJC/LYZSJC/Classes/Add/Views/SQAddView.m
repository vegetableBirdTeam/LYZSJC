//
//  SQAddView.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/15.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQAddView.h"

@interface SQAddView ()

/** 按钮从上面下来的中心位置 */
@property (nonatomic, strong) NSMutableArray *centerHigh;
/** 按钮从下面出来的中心位置 */
@property (nonatomic, strong) NSMutableArray *centerLow;
/** 菜单的中心位置 */
@property (nonatomic, strong) NSMutableArray *centerMenu;
/** 是否需要隐藏 */
@property (nonatomic, assign) BOOL isHidding;

/** 初始化按钮 */
- (void)initImageView;

@end

@implementation SQAddView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _isHidding = NO;
        [self initImageView];
        [self initCenterArray:frame];
        [self setupView];
    }
    return self;
}

- (void)initImageView {
    // 根据图片的位置给按钮一个初始位置
    UIImage *image = [UIImage imageNamed:@"menuChat"];
    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    // 初始化发文字按钮
    _textBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _textBtn.frame = frame;
    [_textBtn setBackgroundImage:[UIImage imageNamed:@"menuText"] forState:UIControlStateNormal];
    
    // 初始化发图片按钮
    _photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _photoBtn.frame = frame;
    [_photoBtn setBackgroundImage:[UIImage imageNamed:@"menuPhoto"] forState:UIControlStateNormal];
    
    // 初始化发视频按钮
    _videoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _videoBtn.frame = frame;
    [_videoBtn setBackgroundImage:[UIImage imageNamed:@"menuQuote"] forState:UIControlStateNormal];
    
    // 初始化发链接按钮
    _linkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _linkBtn.frame = frame;
    [_linkBtn setBackgroundImage:[UIImage imageNamed:@"menuLink"] forState:UIControlStateNormal];
    
    // 初始化发声音按钮
    _voiceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _voiceBtn.frame = frame;
    [_voiceBtn setBackgroundImage:[UIImage imageNamed:@"menuChat"] forState:UIControlStateNormal];
    
    // 初始化敬请期待按钮
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = frame;
    [_button setBackgroundImage:[UIImage imageNamed:@"menuVideo"] forState:UIControlStateNormal];
    
    // 初始化返回按钮
    _backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _backBtn.frame = CGRectMake(0, 0, self.frame.size.width, _textBtn.frame.size. height / 2.0f);
    [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
    _backBtn.backgroundColor = [UIColor redColor];
    _backgroundView = [[UIView alloc] initWithFrame:self.frame];
    
    // 给按钮一个tag值
    _textBtn.tag  = 200;
    _photoBtn.tag = 201;
    _videoBtn.tag = 202;
    _linkBtn.tag  = 203;
    _voiceBtn.tag  = 204;
    _button.tag = 205;
}

- (void)initCenterArray:(CGRect)frame {
    CGFloat widthUnit = frame.size.width / 4.0f;
    CGFloat heightHight = frame.origin.y - _textBtn.frame.size.height / 2.0f;
    CGFloat heightLow = frame.size.height + _textBtn.frame.size.height / 2.0f;
    CGFloat gap = _textBtn.frame.size.height / 2.0f + 5.0f;
    _centerHigh = [[NSMutableArray alloc] initWithCapacity:0];
    CGPoint high1 = CGPointMake(widthUnit, heightHight);
    CGPoint high2 = CGPointMake(widthUnit * 2, heightHight * 2);
    CGPoint high3 = CGPointMake(widthUnit * 3, heightHight * 3);
    [_centerHigh addObject:NSStringFromCGPoint(high1)];
    [_centerHigh addObject:NSStringFromCGPoint(high2)];
    [_centerHigh addObject:NSStringFromCGPoint(high3)];
    
    _centerLow = [[NSMutableArray alloc] initWithCapacity:0];
    CGFloat lowH = frame.size.height + _backBtn.frame.size.height / 2.0f;
    CGPoint low1 = CGPointMake(widthUnit, heightLow);
    CGPoint low2 = CGPointMake(widthUnit * 2, heightLow);
    CGPoint low3 = CGPointMake(widthUnit * 3, heightLow);
    CGPoint low4 = CGPointMake(widthUnit * 2, lowH);
    [_centerLow addObject:NSStringFromCGPoint(low1)];
    [_centerLow addObject:NSStringFromCGPoint(low2)];
    [_centerLow addObject:NSStringFromCGPoint(low3)];
    [_centerLow addObject:NSStringFromCGPoint(low4)];
    
    _centerMenu = [[NSMutableArray alloc] initWithCapacity:0];
    CGFloat menuH = frame.size.height / 2.0f;
    CGFloat menuHeight = frame.size.height - _backBtn.frame.size.height / 2.0f;
    CGPoint menu1 = CGPointMake(widthUnit, menuH - gap);
    CGPoint menu2 = CGPointMake(widthUnit * 2, menuH - gap);
    CGPoint menu3 = CGPointMake(widthUnit * 3, menuH - gap);
    CGPoint menu4 = CGPointMake(widthUnit, menuH + gap);
    CGPoint menu5 = CGPointMake(widthUnit * 2, menuH + gap);
    CGPoint menu6 = CGPointMake(widthUnit * 3, menuH + gap);
    CGPoint menu7 = CGPointMake(widthUnit * 2, menuHeight);
    [_centerMenu addObject:NSStringFromCGPoint(menu1)];
    [_centerMenu addObject:NSStringFromCGPoint(menu2)];
    [_centerMenu addObject:NSStringFromCGPoint(menu3)];
    [_centerMenu addObject:NSStringFromCGPoint(menu4)];
    [_centerMenu addObject:NSStringFromCGPoint(menu5)];
    [_centerMenu addObject:NSStringFromCGPoint(menu6)];
    [_centerMenu addObject:NSStringFromCGPoint(menu7)];
}

- (void)setupView {
    self.hidden = YES;
    _backgroundView.backgroundColor = SQRGBColor(61, 77, 100);
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    [_backgroundView addGestureRecognizer:singleTap];
    _backgroundView.userInteractionEnabled = YES;
    
    _backBtn.hidden = YES;
    _backBtn.userInteractionEnabled = YES;
    _backBtn.backgroundColor = SQRGBColor(61, 77, 97);
    _backBtn.tintColor = SQRGBColor(133, 141, 152);
    [_backBtn addTarget:self action:@selector(handleTap) forControlEvents:UIControlEventTouchUpInside];
    
    [_textBtn addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    [_photoBtn addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    [_videoBtn addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    [_linkBtn addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    [_voiceBtn addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    [_button addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_backgroundView];
    [self addSubview:_textBtn];
    [self addSubview:_photoBtn];
    [self addSubview:_videoBtn];
    [self addSubview:_voiceBtn];
    [self addSubview:_linkBtn];
    [self addSubview:_button];
    [self addSubview:_backBtn];
}

- (void)clickMenu:(UIButton *)sender {
    int index = (int)sender.tag;
    //    [self hideMenuView];
    if (_delegate != nil && [self.delegate respondsToSelector:@selector(didClickMenu:)]) {
        [self.delegate didClickMenu:index];
    }
}

- (void)handleTap {
    [self hideMenuView];
}

- (void)hideMenuView {
    if (_isHidding) {
        return ;
    }
    _isHidding = YES;
    
    // Nevermind button
    _backBtn.center = CGPointFromString([_centerMenu objectAtIndex:6]);
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.backBtn.center = CGPointFromString([self.centerLow objectAtIndex:3]);
    } completion:^(BOOL finished) {
        self.backBtn.hidden = YES;
        self.isHidding = NO;
    }];
    
    // Photo Image
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.photoBtn.center = CGPointFromString([_centerHigh objectAtIndex:1]);
    } completion:^(BOOL finished) {
        self.hidden = true;
    }];
    
    // Text | Chat | Quote Image
    [UIView animateWithDuration:0.6 delay:0.1 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.textBtn.center = CGPointFromString([_centerHigh objectAtIndex:0]);
        self.videoBtn.center = CGPointFromString([_centerHigh objectAtIndex:2]);
        self.voiceBtn.center = CGPointFromString([_centerHigh objectAtIndex:1]);
    } completion:nil];
    
    // Link | Video Image
    [UIView animateWithDuration:0.6 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.linkBtn.center = CGPointFromString([_centerHigh objectAtIndex:0]);
        self.button.center = CGPointFromString([_centerHigh objectAtIndex:2]);
    } completion:^(BOOL finished) {
        if (_delegate != nil && [self.delegate respondsToSelector:@selector(didCloseMenu)]) {
            [self.delegate didCloseMenu];
        }
    }];
}

- (void)showMenuView {
    self.hidden = NO;
    
    _backBtn.center = CGPointFromString([_centerLow objectAtIndex:3]);
    _backBtn.hidden = NO;
    [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.backBtn.center = CGPointFromString([_centerMenu objectAtIndex:6]);
    } completion:nil];
    
    // Photo Image
    _photoBtn.center = CGPointFromString([_centerLow objectAtIndex:1]);
    [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.photoBtn.center = CGPointFromString([_centerMenu objectAtIndex:1]);
    } completion:nil];
    
    // Text | Chat | Quote Image
    _textBtn.center = CGPointFromString([_centerLow objectAtIndex:0]);
    _videoBtn.center = CGPointFromString([_centerLow objectAtIndex:2]);
    _voiceBtn.center = CGPointFromString([_centerLow objectAtIndex:1]);
    [UIView animateWithDuration:0.6 delay:0.1 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:1.0 animations:^{
        self.textBtn.center = CGPointFromString([_centerMenu objectAtIndex:0]);
        self.videoBtn.center = CGPointFromString([_centerMenu objectAtIndex:2]);
        self.voiceBtn.center = CGPointFromString([_centerMenu objectAtIndex:4]);
    } completion:nil];
    
    // Link | Video Image
    _linkBtn.center = CGPointFromString([_centerLow objectAtIndex:0]);
    _button.center = CGPointFromString([_centerLow objectAtIndex:2]);
    [UIView animateWithDuration:0.6 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.linkBtn.center = CGPointFromString([_centerMenu objectAtIndex:3]);
        self.button.center = CGPointFromString([_centerMenu objectAtIndex:5]);
    } completion:nil];
}

@end