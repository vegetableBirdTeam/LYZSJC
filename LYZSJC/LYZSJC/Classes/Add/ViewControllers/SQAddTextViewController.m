//
//  SQAddTextViewController.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/21.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQAddTextViewController.h"
#import "SQPlaceholderTextView.h"
#import "SQAddTagToolbar.h"
@interface SQAddTextViewController ()

/** 文本输入控件 */
@property (nonatomic, weak) SQPlaceholderTextView *textView;
/** 工具条 */
@property (nonatomic, weak) SQAddTagToolbar *toolbar;

@end

@implementation SQAddTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SQGlobalBkg;
    
    // 创建nav
    [self setupNav];
}

/**
 *  创建nav
 */
- (void)setupNav
{
    self.title = @"发表文字";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    [leftItem setTintColor:[UIColor blackColor]];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(post)];
    [rightItem setTintColor:[UIColor orangeColor]];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.rightBarButtonItem.enabled = NO; // 默认不能点击
}

/**
 *  返回按钮
 */
- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  发表按钮
 */
- (void)post {
    SQLogFunc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
