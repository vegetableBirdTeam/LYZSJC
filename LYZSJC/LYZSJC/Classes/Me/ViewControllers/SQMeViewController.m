//
//  SQMeViewController.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/14.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQMeViewController.h"

@interface SQMeViewController ()

@end

@implementation SQMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 设置导航栏内容
    self.navigationItem.title = @"我";
    
    //  设置背景色
    self.view.backgroundColor = SQGlobalBkg;
    
    NSLog(@"13");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
