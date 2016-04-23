//
//  SQEmotionKeyboard.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/22.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQEmotionKeyboard.h"
#import "SQEmotionTabBar.h"
#import "SQEmotionListView.h"
#import "SQEmotion.h"
#import "SQEmotionTool.h"
#import <MJExtension.h>

@interface SQEmotionKeyboard ()<SQEmotionTabBarDelegate>

/** 保存正在显示listView */
@property (nonatomic, weak) SQEmotionListView *showingListView;
/** 最近使用表情 */
@property (nonatomic, strong) SQEmotionListView *recentListView;
/** 默认表情 */
@property (nonatomic, strong) SQEmotionListView *defaultListView;
/** 系统表情 */
@property (nonatomic, strong) SQEmotionListView *emojiListView;
/** 浪小花 */
@property (nonatomic, strong) SQEmotionListView *lxhListView;

/** tabBar */
@property (nonatomic, weak) SQEmotionTabBar *tabBar;

@end

@implementation SQEmotionKeyboard

#pragma mark - 懒加载
- (SQEmotionListView *)recentListView {
    if (!_recentListView) {
        self.recentListView = [[SQEmotionListView alloc] init];
        
        // 加载沙盒中的数据
        self.recentListView.emotions = [SQEmotionTool recentEmotions];
    }
    return _recentListView;
}

- (SQEmotionListView *)defaultListView {
    if (!_defaultListView) {
        self.defaultListView = [[SQEmotionListView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"default.plist" ofType:nil];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        self.defaultListView.emotions = [SQEmotion mj_objectArrayWithKeyValuesArray:array];
    }
    return _defaultListView;
}

- (SQEmotionListView *)emojiListView {
    if (!_emojiListView) {
        self.emojiListView = [[SQEmotionListView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"emoji.plist" ofType:nil];
        
        self.emojiListView.emotions = [SQEmotion mj_objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
    }
    return _emojiListView;
}

- (SQEmotionListView *)lxhListView {
    if (!_lxhListView) {
        self.lxhListView = [[SQEmotionListView alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"lxh.plist" ofType:nil];
        self.lxhListView.emotions = [SQEmotion mj_objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
    }
    return _lxhListView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        // tabBar
        SQEmotionTabBar *tabBar = [[SQEmotionTabBar alloc] init];
        tabBar.delegate = self;
        [self addSubview:tabBar];
        self.tabBar = tabBar;
        
        // 表情选中的通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(emotionDidSelect) name:@"EmotionDidSelectNotification" object:nil];
    }
    
    return self;
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 1.tabbar
    self.tabBar.width = self.width;
    self.tabBar.height = 37;
    self.tabBar.x = 0;
    self.tabBar.y = self.height - self.tabBar.height;
    
    // 2.表情内容
    self.showingListView.x = self.showingListView.y = 0;
    self.showingListView.width = self.width;
    self.showingListView.height = self.tabBar.y;
    
}

- (void)emotionDidSelect {
    
    self.recentListView.emotions = [SQEmotionTool recentEmotions];
}

-(void)dealloc {
    
    [SQNotificationCenter removeObserver:self];
}

#pragma mark --- XFEmotionTabBarDelegate ----

- (void)emotionTabBar:(SQEmotionTabBar *)tabBar didSelectButton:(SQEmotionTabBarButtonType)buttonType {
    
    // 移除正在显示的listView控件
    [self.showingListView removeFromSuperview];
    
    // 根据按钮类型，切换contentView上面的listview
    switch (buttonType) {
        case SQEmotionTabBarButtonTypeDefault: { // 默认
            [self addSubview:self.defaultListView];
            break;
        }
        case SQEmotionTabBarButtonTypeLxh: { // 浪小花
            [self addSubview:self.lxhListView];
            break;
        }
        case SQEmotionTabBarButtonTypeEmoji: { // Emoji
            [self addSubview:self.emojiListView];
            break;
        }
        case SQEmotionTabBarButtonTypeRecent: { // 最近
            [self addSubview:self.recentListView];
            break;
        }
    }
    
    // 设置正在显示的listView
    self.showingListView = [self.subviews lastObject];
    
    // 重新计算子控件的frame(setNeedsLayout内部会在恰当的时刻，重新调用layoutSubviews，重新布局子控件)
    [self setNeedsLayout];
}
@end
