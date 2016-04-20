//
//  JLKSportDetailViewController.m
//  LYZSJC
//
//  Created by zero on 16/4/18.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import "JLKSportDetailViewController.h"
#import <SVProgressHUD.h>

@interface JLKSportDetailViewController ()  <UIWebViewDelegate>

@property (nonatomic, strong) UIView *whiteView;

@end

@implementation JLKSportDetailViewController

- (void)loadView
{
    self.whiteView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _whiteView.backgroundColor = [UIColor whiteColor];
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.delegate = self;
    self.view = webView;
    
    [self.view addSubview:self.whiteView];
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
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
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
    [SVProgressHUD dismiss];
    [self.whiteView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end