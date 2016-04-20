//
//  SQMessageViewController.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/14.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQJobViewController.h"

#import "YGCategoryTableViewCell.h"
#import "YGJobTableViewCell.h"
#import "YGJobDetailViewController.h"

#import "MJRefresh.h"

@interface SQJobViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *leftTableView;    // 左边列表
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;   // 右边列表

@property (nonatomic, strong) NSMutableArray *leftCategoryArray;
@property (nonatomic, strong) NSMutableArray *rightJobArray;

@property (nonatomic, strong) NSString *ceshi; // 测试

@end

@implementation SQJobViewController

#pragma mark - lazy loading

- (NSMutableArray *)leftCategoryArray {
    if (!_leftCategoryArray) {
        self.leftCategoryArray = [NSMutableArray array];
    }
    return _leftCategoryArray;
}

- (NSMutableArray *)rightJobArray {
    if (!_rightJobArray) {
        self.rightJobArray = [NSMutableArray array];
    }
    return _rightJobArray;
}

#pragma mark - view did load

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏内容
    self.navigationItem.title = @"兼职";
    
    //  设置背景色
    self.view.backgroundColor = SQGlobalBkg;
    
    // 初始化控件
    [self setupTableView];
    
    // 左侧边栏数据
    [self requestCategory];
    
    // 刷新数据
    [self setupRefresh];
}

#pragma mark - 初始化控件

// 控件初始化
- (void)setupTableView
{
    // 注册左边类别表格视图的Cell
    [self.leftTableView registerNib:[UINib nibWithNibName:@"YGCategoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"categoryCell"];
    // 注册右边用户表格视图的Cell
    [self.rightTableView registerNib:[UINib nibWithNibName:@"YGJobTableViewCell" bundle:nil] forCellReuseIdentifier:@"jobTableCell"];
    
    self.rightTableView.backgroundColor = SQGlobalBkg;
    
    self.rightTableView.showsVerticalScrollIndicator = NO; // 关闭滚动条
    
    self.leftTableView.separatorStyle = NO;
    
    // 设置inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.leftTableView.contentInset = UIEdgeInsetsMake(64, 0, 44, 0);
    self.rightTableView.contentInset = self.leftTableView.contentInset;
    // 设置每行的行高
    /**自适应高度*/
    
    self.rightTableView.rowHeight = UITableViewAutomaticDimension;
    self.rightTableView.estimatedRowHeight = 300;
}

/**
 *  添加刷新控件
 */
-  (void)setupRefresh {
    self.rightTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];    // 上拉刷新
    self.rightTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];// 下拉加载
}

#pragma mark -  请求数据

/**
 *  请求数据刷新
 */
- (void)requestCategory {
    self.leftCategoryArray = [@[@"全部", @"传单派发", @"促销导购", @"话务客服", @"礼仪模特", @"家教助教", @"服务员", @"外卖派送", @"校园代理", @"打包分拣", @"展会协助", @"其他"] mutableCopy];
}

#pragma mark - 刷新方法

/**
 *  上拉刷新
 */
- (void)refreshHeader {
    [self.rightTableView.mj_header endRefreshing];
    
    [self.rightTableView reloadData];
}

/**
 *  下拉加载
 */
- (void)refreshFooter {
    [self.rightTableView.mj_footer endRefreshing];
}

/**
 *  时刻监测footer的状态
 */
- (void)checkFooterState {
    
}

#pragma mark - 数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.leftTableView) {
        return self.leftCategoryArray.count;
    } else {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        YGCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"categoryCell" forIndexPath:indexPath];
        
        cell.category_name.text = self.leftCategoryArray[indexPath.row];
        
        return cell;
        
    } else {
        
        YGJobTableModel *model = [[YGJobTableModel alloc] init];
        
        YGJobTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jobTableCell" forIndexPath:indexPath];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell setDataWithModel:model];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        
        [self.rightTableView.mj_header beginRefreshing];
        
        [self.rightTableView reloadData];
    
    } else {
        
        YGJobDetailViewController *jobDetailVC = [[YGJobDetailViewController alloc] init];
        
        // 传值
        //
        
        [self.navigationController pushViewController:jobDetailVC animated:YES];
        
    }
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
