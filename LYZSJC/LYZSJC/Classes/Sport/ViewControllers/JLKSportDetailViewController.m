//
//  JLKSportDetailViewController.m
//  LYZSJC
//
//  Created by zero on 16/4/18.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import "JLKSportDetailViewController.h"

@interface JLKSportDetailViewController ()  <UIWebViewDelegate>


@end

@implementation JLKSportDetailViewController

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = self;
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

#pragma mark - WebView Delegate -
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('foot_joy')[0].style.display = 'NONE'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('margin_content')[0].style.display = 'NONE'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('display_in a_buttom')[0].style.display = 'NONE'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('margin_buttom')[0].style.display = 'NONE'"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end