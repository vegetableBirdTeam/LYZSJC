//
//  SQHomeMenuViewController.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/19.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQHomeMenuViewController.h"

@interface SQHomeMenuViewController ()

/** 数据列表 */
@property (nonatomic, strong) NSArray *dataArray;

@end

static NSString * const HomeMenuID = @"menuCell";

@implementation SQHomeMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    
    self.view.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableview:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeMenuID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:HomeMenuID];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(showTopic:)]) {
        [self.delegate showTopic:(int)indexPath.row];
    }
}

@end