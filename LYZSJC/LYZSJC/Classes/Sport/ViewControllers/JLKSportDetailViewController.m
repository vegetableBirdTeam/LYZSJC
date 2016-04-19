//
//  JLKSportDetailViewController.m
//  LYZSJC
//
//  Created by zero on 16/4/18.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import "JLKSportDetailViewController.h"

@interface JLKSportDetailViewController () 


@end

@implementation JLKSportDetailViewController

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    self.view = webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadWebView];
}

/**
    创建WebView
 */
- (void)loadWebView
{
    // 加载页面
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIWebView *webView = (UIWebView *)self.view;
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end