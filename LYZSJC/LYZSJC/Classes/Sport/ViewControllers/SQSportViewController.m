//
//  SQSportViewController.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/14.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQSportViewController.h"
#import "JLKSportDetailViewController.h"
#import "JLKSportModel.h"
#import "SQSportCell.h"

#import <MJRefresh.h>
#import <AFNetworking.h>

#define kPAGESIZE 10

@interface SQSportViewController ()

/** 运动数据 */
@property (nonatomic, strong) NSMutableArray *sports;
/** 当前页码 */
@property (nonatomic, assign) NSInteger page;
/** 上一次请求参数 */
@property (nonatomic, strong) NSDictionary *params;

@end

static NSString * const SQSportID = @"sport";

@implementation SQSportViewController

- (NSMutableArray *)sports
{
    if (_sports == nil) {
        self.sports = [NSMutableArray array];
    }
    return _sports;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化表格
    [self setupTableView];
    
    // 添加刷新控件
    [self setupRefresh];
}

/**
 *  初始化表格
 */
- (void)setupTableView {
    // 设置内边距
    CGFloat bottom = self.tabBarController.tabBar.height;
    CGFloat top = SQTitlesViewY + SQTitlesViewH + JLKStepViewH;
    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 设置滚动条的内边距
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SQSportCell class]) bundle:nil] forCellReuseIdentifier:SQSportID];
}

/**
 *  添加刷新控件
 */
- (void)setupRefresh {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    // 根据拖拽比例自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}

#pragma mark - 数据梳理
/**
 *  加载新的运动数据
 */
- (void)loadNewTopics {
    // 结束上拉
    [self.tableView.mj_footer endRefreshing];
    
    // 清空页码
    self.page = 1;
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@(1) forKey:@"page"];
    [params setValue:@(kPAGESIZE) forKey:@"pagesize"];
    params[@"subject_id"] = @(self.type);
    
    self.params = params;
    
    // 发送请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:SPORTURL parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.params != params) return;
        
        [self.sports removeAllObjects];
        
        // 字典 -> 模型
        NSDictionary *dataDic = responseObject;
        NSArray *arr = dataDic[@"data"];
        for (NSDictionary *dic in arr) {
            JLKSportModel *model = [[JLKSportModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.sports addObject:model];
        }
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) return;
        
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
    }];
}

/**
 *  加载更多的运动数据
 */
- (void)loadMoreTopics {
    // 结束下拉
    [self.tableView.mj_header endRefreshing];
    
    NSInteger page = self.page + 1;
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@(page) forKey:@"page"];
    [params setValue:@(kPAGESIZE) forKey:@"pagesize"];
    params[@"subject_id"] = @(self.type);
    
    self.params = params;
    
    // 发送请求
    [[AFHTTPSessionManager manager] POST:SPORTURL parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.params != params) return;
        
        
        // 字典 -> 模型
        NSDictionary *dataDic = responseObject;
        NSArray *arr = dataDic[@"data"];
        for (NSDictionary *dic in arr) {
            JLKSportModel *model = [[JLKSportModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [self.sports addObject:model];
        }
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
        
        // 设置页码
        self.page = page;
        
        // 判断是否数据刷新完毕
        if (arr.count != kPAGESIZE) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) return;
        
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}

- (NSInteger)tableView:(UITableView *)ableView numberOfRowsInSection:(NSInteger)section {
    self.tableView.mj_footer.hidden = (self.sports.count == 0);
    return self.sports.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SQSportCell *cell = [tableView dequeueReusableCellWithIdentifier:SQSportID];
    cell.model = self.sports[indexPath.row];
    
    if (indexPath.row % 2) {
        cell.backgroundColor = [UIColor whiteColor];
    } else {
        cell.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JLKSportModel *model = self.sports[indexPath.row];
    JLKSportDetailViewController *detailVC = [[JLKSportDetailViewController alloc] init];
    detailVC.urlString = model.article_url;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
