//
//  SQAddViewController.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/14.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQAddViewController.h"
#import "SQAddView.h"

@interface SQAddViewController ()<SQAddViewDelegate>

@property (nonatomic, weak) SQAddView *addView;

@end

@implementation SQAddViewController

- (void)loadView {
    SQAddView *addView = [[SQAddView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    addView.delegate = self;
    self.view = addView;
    [addView showMenuView];
    self.addView = addView;
    addView.backgroundColor = [UIColor clearColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -添加按钮的代理
/**
 *  点击菜单栏按钮
 */
- (void)didClickMenu:(int)index {
    
}

/**
 *  关闭菜单
 */
- (void)didCloseMenu {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
}

@end
