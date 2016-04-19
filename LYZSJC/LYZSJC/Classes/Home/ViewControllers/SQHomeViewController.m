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

@interface SQHomeViewController ()

@end


@implementation SQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏内容
    [self setupNav];
    
    // 初始化子控制器
//    [self setupChildViewControllers];
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
    
    // 设置图片和文字
    NSString *name = @"全部";
    SQHomeTitleButton *button = [[SQHomeTitleButton alloc] init];
    [button setTitle:name forState:UIControlStateNormal];
    [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = button;
}

- (void)titleClick:(UIButton *)button {
    SQLogFunc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end