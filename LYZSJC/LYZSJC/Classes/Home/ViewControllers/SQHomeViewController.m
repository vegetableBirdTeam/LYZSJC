//
//  SQHomeViewController.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/14.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQHomeViewController.h"
#import "SQTopicTableViewController.h"
#import "SQHomeTitleButton.h"
#import "SQDropdownView.h"
#import "SQHomeMenuViewController.h"

@interface SQHomeViewController ()<SQDropdownViewDelegate, SQHomeMenuViewControllerDelegate>

/** 显示状态栏 */
@property (nonatomic, weak) SQDropdownView *dropView;
/** 数据列表 */
@property (nonatomic, strong) NSArray *dataArray;
/** 导航栏上面的按钮 */
@property (nonatomic, weak) SQHomeTitleButton *button;

@end


@implementation SQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    
    // 设置导航栏内容
    [self setupNav];
    
    // 初始化子控制器
    [self setupChildViewControllers];
    
    [self showTopic:0];
}

/**
 *  初始化子控制器
 */
- (void)setupChildViewControllers {
    SQTopicTableViewController *all = [[SQTopicTableViewController alloc] init];
    all.title = @"全部";
    all.type = SQTopicTypeAll;
    [self addChildViewController:all];
    
    SQTopicTableViewController *video = [[SQTopicTableViewController alloc] init];
    video.title = @"视频";
    video.type = SQTopicTypeVideo; 
    [self addChildViewController:video];
    
    SQTopicTableViewController *voice = [[SQTopicTableViewController alloc] init];
    voice.title = @"声音";
    voice.type = SQTopicTypeVoice;
    [self addChildViewController:voice];
    
    SQTopicTableViewController *picture = [[SQTopicTableViewController alloc] init];
    picture.title = @"图片";
    picture.type = SQTopicTypePicture;
    [self addChildViewController:picture];
    
    SQTopicTableViewController *word = [[SQTopicTableViewController alloc] init];
    word.title = @"段子";
    word.type = SQTopicTypeWord;
    [self addChildViewController:word];
}

/**
 *  设置导航栏内容
 */
- (void)setupNav {
    // 设置导航栏内容
    self.navigationItem.title = @"瞧瞧";
    
    //  设置背景色
    self.view.backgroundColor = SQGlobalBkg;
    
    // 不要自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIBarButtonItem *item = [UIBarButtonItem itemWithImage:@"mainCellComment" highImage:@"mainCellCommentClick" target:self action:@selector(messageClick)];
    self.navigationItem.rightBarButtonItem = item;
    
    // 设置图片和文字
    NSString *name = @"全部";
    SQHomeTitleButton *button = [[SQHomeTitleButton alloc] init];
    [button setTitle:name forState:UIControlStateNormal];
    [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = button;
    self.button = button;
}

/**
 *  消息按钮
 */
- (void)messageClick {
    
}

- (void)titleClick:(UIButton *)button {
    SQDropdownView *dropView = [SQDropdownView menu];
    self.dropView = dropView;
    dropView.delegate = self;
    SQHomeMenuViewController *vc = [[SQHomeMenuViewController alloc] init];
    vc.delegate = self;
    
    vc.view.height = 200;
    
    // 下拉列表的控制器
    dropView.contentController = vc;
    
    // 显示
    [dropView showFrom:button];
}

#pragma mark -SQDropdownViewDelegate的代理方法
- (void)dropdownMenuDidSHow:(SQDropdownView *)menu {
    UIButton *button = (UIButton *)self.navigationItem.titleView;
    // 让箭头向下
    button.selected = YES;
}

- (void)dropdownMenuDidDismiss:(SQDropdownView *)menu {
    UIButton *button = (UIButton *)self.navigationItem.titleView;
    // 让箭头向上
    button.selected = NO;
}

#pragma mark -SQHomeMenuViewControllerDelegate的代理方法
- (void)showTopic:(int)index {
    UIViewController *vc = self.childViewControllers[index];
    [self.view addSubview:vc.view];
    [self.dropView dismiss];
    [self.button setTitle:self.dataArray[index] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end