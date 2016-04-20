//
//  YGJobDetailViewController.m
//  LYZSJC
//
//  Created by Lovecx on 16/4/19.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "YGJobDetailViewController.h"
#import "YGJobDetailHeaderView.h"

#define kString @"     中国证券网讯 来自中国外汇交易中心的最新数据显示，4月18日人民币对美元汇率中间价报6.4787，较前一交易日(4月15日)中间价6.4908升值121点。4月18日凌晨2点，上海黄浦区东街37弄4号发生火灾，过火面积约100平方米。火已扑灭，4人遇难。当日下午6时许，上海市黄浦区人民政府互联网信息办公室公众号“上海黄浦”对本次火灾进行了通报。     中国证券网讯 来自中国外汇交易中心的最新数据显示，4月18日人民币对美元汇率中间价报6.4787，较前一交易日(4月15日)中间价6.4908升值121点。4月18日凌晨2点，上海黄浦区东街37弄4号发生火灾，过火面积约100平方米。火已扑灭，4人遇难。当日下午6时许，上海市黄浦区人民政府互联网信息办公室公众号“上海黄浦”对本次火灾进行了通报。"

@interface YGJobDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation YGJobDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**头视图用户信息*/
    YGJobDetailHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"YGJobDetailHeaderView" owner:self options:nil] lastObject];
    
    headerView.frame = CGRectMake(0, 0, SQScreenW, [self heightForString] - 14);
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 1000;
    
    [headerView assignment];
    
    self.tableView.tableHeaderView = headerView;
}

/**
 *  自适应高度
 */
- (CGFloat)heightForString {
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17], NSFontAttributeName, nil];
    CGRect rect = [kString boundingRectWithSize:CGSizeMake(SQScreenW - 20, 0) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil];
    
    return rect.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"213"];
    
    cell.textLabel.text = @"10";
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
