//
//  YGJobDetailViewController.m
//  LYZSJC
//
//  Created by Lovecx on 16/4/19.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "YGJobDetailViewController.h"
#import "YGJobDetailHeaderView.h"
#import "YGJobCommitCell.h"

#define kString @"     中国证券网讯 来自中国外汇交易中心的最新数据显示，4月18日人民币对美元汇率中间价报6.4787，较前一交易日(4月15日)中间价6.4908升值121点。4月18日凌晨2点，上海黄浦区东街37弄4号发生火灾，过火面积约100平方米。火已扑灭，4人遇难。当日下午6时许，上海市黄浦区人民政府互联网信息办公室公众号“上海黄浦”对本次火灾进行了通报。     中国证券网讯 来自中国外汇交易中心的最新数据显示，4月18日人民币对美元汇率中间价报6.4787，较前一交易日(4月15日)中间价6.4908升值121点。4月18日凌晨2点，上海黄浦区东街37弄4号发生火灾，过火面积约100平方米。火已扑灭，4人遇难。当日下午6时许，上海市黄浦区人民政府互联网信息办公室公众号“上海黄浦”对本次火灾进行了通报。"

@interface YGJobDetailViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

/**工具栏底部间距*/
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSapce;

@property (nonatomic, strong) NSMutableArray *nameArray;    // 测试
@property (nonatomic, strong) NSMutableArray *content;      // 测试

@property (nonatomic, assign) CGFloat ceshi; // 测试

@end

@implementation YGJobDetailViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.ceshi = [self heightForString];
    
    [self createHeaderView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"详情";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.nameArray = [@[@"沈强", @"季良坤", @"黄玉玲", @"花花", @"小红", @"东方不败", @"呵呵哒", @"令狐冲", @"隔壁老王", @"中二"] mutableCopy];
    self.content = [@[@"凤凰科技讯 北京时间4月20日消息，苹果新款12英寸MacBook正式亮相，初步测试报告也已经出炉",
                      @"测试显示英特尔Skylake处理器的性能比前代产品有了中等程度的提升，而笔记本安装的SSD（固态硬盘）写速度提升相当明显。",
                      @" Geekbench 3测试发现，安装英特尔Core m5（1.2GHz）处理器的MacBook速度比去年推出的机型快了大约20%。",
                      @"Blackmagic测试显示，",
                      @"2016 MacBook新SSD的写速度比前代产品快了80-90%，读速度也有了小幅的提升。未来几天或者几周，更深入的测试将会告诉我们新MacBook的具体性能，但从早期测试来看产品符合苹果营销宣传时的介绍。",
                      @"绍",
                      @"😁",
                      @" 12英寸MacBook升级了更快的1866MHz内存，电池续航时间延长了一小时，运行时间最高可达10小时。",
                      @"如果用户需要更高速的MacBook，苹果可以将产品升级到1.3 GHz英特尔双核m7处理器，只是512G版本需要增加150美元，入门级256GB版本（1.1GHz m3处理器）需要增加250美元。所有机型都配有8GB内存，安装英特尔HD Graphics 515芯片。",
                      @"😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁😁",] mutableCopy];
    
    [self createSteup];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 1000;
    [self.tableView registerNib:[UINib nibWithNibName:@"YGJobCommitCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"commitCell"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

#pragma mark - 基本设置

/**
 *  添加手势
 */
- (void)createSteup {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

-(void)viewTapped:(UITapGestureRecognizer*)tap1 {
    
    [self.view endEditing:YES];
    
}

- (void)keyboardWillChangeFrame:(NSNotification *)note {
    
    // 键盘显示\隐藏完毕的frame
    CGRect frame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 修改底部约束
    self.bottomSapce.constant = SQScreenH - frame.origin.y;
    // 动画时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationCurveUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  头视图 , cell 注册
 */
- (void)createHeaderView {
    
    /**头视图用户信息*/
    YGJobDetailHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"YGJobDetailHeaderView" owner:self options:nil] lastObject];
    headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.ceshi + 117);
    [headerView assignment];
    self.tableView.tableHeaderView = headerView;
    
}



#pragma mark - tableView datagate dataSource

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
    [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
    
    [self.view endEditing:YES];
    
}

/**
 *  自适应高度
 */
- (CGFloat)heightForString {
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17], NSFontAttributeName, nil];
    CGRect rect = [kString boundingRectWithSize:CGSizeMake(SQScreenW - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil];
    
    return rect.size.height;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YGJobCommitCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commitCell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell setData];
    
    cell.userName.text = self.nameArray[indexPath.row];
    cell.content.text = self.content[indexPath.row];
    
    return cell;
    
}

//  可以成为第一响应者
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //创建menu菜单
    UIMenuController *menu = [UIMenuController sharedMenuController];
    
    if (menu.isMenuVisible) {
        
        [menu setMenuVisible:NO animated:YES];
        
    } else {
        
        YGJobCommitCell *cell = (YGJobCommitCell *)[tableView cellForRowAtIndexPath:indexPath];
        [cell becomeFirstResponder];
        
        UIMenuItem *like = [[UIMenuItem alloc] initWithTitle:@"赞" action:@selector(like)];          // 赞
        UIMenuItem *reply = [[UIMenuItem alloc] initWithTitle:@"回复" action:@selector(reply)];        // 回复
        UIMenuItem *report = [[UIMenuItem alloc] initWithTitle:@"举报" action:@selector(report)];      // 举报
        menu.menuItems = @[like, reply, report];
        CGRect rect = CGRectMake(0, cell.height / 2, cell.width, cell.height / 2);
        [menu setTargetRect:rect inView:cell];
        [menu setMenuVisible:YES animated:YES];
        
    }
    
}

#pragma mark - 菜单方法

- (void)like {
    NSLog(@"赞他妈的赞");
}

- (void)reply {
    NSLog(@"SB回复");
}

- (void)report {
    NSLog(@"你他妈的敢举报老子");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
