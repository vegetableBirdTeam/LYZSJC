//
//  JLKSportRankListViewController.m
//  LYZSJC
//
//  Created by zero on 16/4/20.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import "JLKSportRankListViewController.h"
#import "JLKRankCell.h"

@interface JLKSportRankListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *rankListArray;

@end

@implementation JLKSportRankListViewController

- (NSMutableArray *)rankListArray
{
    if (!_rankListArray) {
        self.rankListArray = [NSMutableArray array];
        
        for (NSInteger i = 0; i < 50; i++) {
            JLKRankModel *model = [[JLKRankModel alloc] init];
            model.iconUrl = @"http://p2.wmpic.me/article/2015/03/16/1426483393_DXGAJIiR.jpeg";
            model.username = @"我帅吗?";
            [_rankListArray addObject:model];
        }
    }
    
    return _rankListArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
}

/**
 *  创建排名列表视图
 */
- (void)createTableView
{
    UITableView *rankListView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    //rankListView.separatorStyle = UITableViewCellSeparatorStyleNone;
    rankListView.delegate = self;
    rankListView.dataSource = self;
    
    [rankListView registerClass:[JLKRankCell class] forCellReuseIdentifier:@"JLKRankCell"];
    
    [self.view addSubview:rankListView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate & DataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rankListArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [JLKRankCell autoHeightWithRank:indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JLKRankCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JLKRankCell"];
    cell.rank = indexPath.row;
    cell.model = self.rankListArray[indexPath.row];
    cell.userInteractionEnabled = NO;
    
    return cell;
}

@end
