//
//  SQAddViewController.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/14.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQAddViewController.h"
#import "SQAddTextViewController.h"
#import "SQNavigationController.h"
#import "SQAddView.h"

@interface SQAddViewController ()<SQAddViewDelegate>

@property (nonatomic, weak) SQAddView *addView;
@property (nonatomic, strong) SQAddTextViewController *addVC;
@property (nonatomic, assign) int index;

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
    
    _addVC = [[SQAddTextViewController alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -添加按钮的代理
/**
 *  点击菜单栏按钮
 */
- (void)didClickMenu:(int)index {
    self.index = index;
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
    if (self.index == 200) {
        SQNavigationController *nav = [[SQNavigationController alloc] initWithRootViewController:_addVC];
        
        // 这里不能使用self来弹出其他控制器，因为self执行了dismiss操作
        UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
        [root presentViewController:nav animated:YES completion:nil];
    }
}

@end
