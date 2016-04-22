//
//  SQMeViewController.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/14.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQMeViewController.h"
#import "JLKUserInfoView.h"

@interface SQMeViewController () <UITableViewDelegate, UITableViewDataSource>

/** 用户模型 */
@property (nonatomic, strong) JLKUserInfo *userInfo;

@end

@implementation SQMeViewController

- (JLKUserInfo *)userInfo
{
    if (!_userInfo) {
        self.userInfo = [[JLKUserInfo alloc] init];
        _userInfo.iconUrl = @"http://p2.wmpic.me/article/2015/03/16/1426483393_DXGAJIiR.jpeg";
        _userInfo.username = @"我最萌";
        _userInfo.gender = @"男";
        _userInfo.focusCnt = @(10);
        _userInfo.collectCnt = @(10);
        _userInfo.fansCnt = @(0);
    }
    return _userInfo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏内容
    self.navigationItem.title = @"我";
    
    //  设置背景色
    self.view.backgroundColor = SQGlobalBkg;
    
    // 创建 TableView
    [self createTableView];
    
    // 创建导航栏内容
    [self createNavigationItem];
}

/**
 *  创建 TableView
 */
- (void)createTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    JLKUserInfoView *userinfoView = [[[NSBundle mainBundle] loadNibNamed:@"JLKUserInfoView" owner:self options:nil] lastObject];
    userinfoView.frame = CGRectMake(0, 0, SQScreenW, 200);
    userinfoView.userinfo = self.userInfo;
    
    tableView.tableHeaderView = userinfoView;
    
    [self.view addSubview:tableView];
}

/**
 *  创建导航按钮
 */
- (void)createNavigationItem
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(pushSetting)];
}

/**
 *  推出设置页面
 */
- (void)pushSetting
{
    
}

#pragma mark - TableView Delegate & DataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end