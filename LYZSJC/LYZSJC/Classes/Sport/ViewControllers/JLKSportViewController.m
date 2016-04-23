//
//  JLKEssenceViewController.m
//  LYZSJC
//
//  Created by zero on 16/4/18.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import "JLKSportViewController.h"
#import "SQSportViewController.h"
#import "JLKSportRankListViewController.h"

#import "JLKPedometer.h"

@interface JLKSportViewController () <UIScrollViewDelegate>

/** 标签栏底部的红色指示器 */
@property (nonatomic, weak) UIView *indicatorView;
/** 当前选中的按钮 */
@property (nonatomic, weak) UIButton *selectedBtn;
/** 顶部的标签 */
@property (nonatomic, weak) UIView *titlesView;
/** 底部的所有内容 */
@property (nonatomic, weak) UIScrollView *contentView;

/** 步数视图 */
@property (nonatomic, strong) UIButton *stepCountButton;

@end

@implementation JLKSportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏
    [self setupNav];
    
    // 初始化子控制器
    [self setupChildViewControllers];
    
    // 设置步数视图
    [self setupStepView];
    
    // 设置顶部的标签栏
    [self setupTitlesView];
    
    // 底部的scrollView
    [self setupContentView];
}

/**
 *  初始化子控制器
 */
- (void)setupChildViewControllers {
    SQSportViewController *sportEquipment = [[SQSportViewController alloc] init];
    sportEquipment.title = @"跑步装备";
    sportEquipment.type = 2;
    [self addChildViewController:sportEquipment];
    
    SQSportViewController *sportDevelop = [[SQSportViewController alloc] init];
    sportDevelop.title = @"提高训练";
    sportDevelop.type = 3;
    [self addChildViewController:sportDevelop];
    
    SQSportViewController *sportStory = [[SQSportViewController alloc] init];
    sportStory.title = @"跑步故事";
    sportStory.type = 4;
    [self addChildViewController:sportStory];
}

/**
 *  底部的scrollView
 */
- (void)setupContentView {
    // 不要自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    self.contentView = contentView;
    
    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];
}

/**
 *  步数视图
 */
- (void)setupStepView {
    UIView *stepView = [[UIView alloc] init];
    stepView.alpha = 0.5;
    stepView.width = SQScreenW;
    stepView.height = JLKStepViewH;
    stepView.y = SQTitlesViewY;
    
    self.stepCountButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _stepCountButton.backgroundColor = [UIColor colorWithRed:5 / 255.0 green:39 / 255.0 blue:175 / 255.0 alpha:1.0];
    _stepCountButton.width = stepView.width / 2;
    _stepCountButton.height = stepView.height;
    [_stepCountButton setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    _stepCountButton.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    _stepCountButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _stepCountButton.userInteractionEnabled = NO;
    _stepCountButton.layer.cornerRadius = 10;
    _stepCountButton.layer.masksToBounds = YES;
    [self getStepNumber];
    
    UIButton *rankButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rankButton.backgroundColor = [UIColor redColor];
    rankButton.width = stepView.width / 2;
    rankButton.height = stepView.height;
    rankButton.x = stepView.width / 2;
    rankButton.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    rankButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    rankButton.layer.cornerRadius = 10;
    rankButton.layer.masksToBounds = YES;
    [rankButton setTitle:@"1000名" forState:UIControlStateNormal];
    [rankButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [rankButton addTarget:self action:@selector(pushRankList) forControlEvents:UIControlEventTouchUpInside];
    
    [stepView addSubview:_stepCountButton];
    [stepView addSubview:rankButton];
    
    [self.view addSubview:stepView];
}

/**
 *  获取步数
 */
- (void)getStepNumber
{
    JLKPedometer *pedometer = [[JLKPedometer alloc] init];
    [pedometer stepFromTodayWithHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        NSString *stepString = [pedometerData.numberOfSteps stringValue];
        NSString *titleString = [NSString stringWithFormat:@"%@步", stepString];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_stepCountButton setTitle:titleString forState:UIControlStateNormal];
        });
    }];
}

/**
 *  根据用户ID获取排名
 */
- (void)getRankWithUserID:(NSString *)userID
{
    
}

/**
 *  推出排行界面
 */
- (void)pushRankList
{
    JLKSportRankListViewController *rankVC = [[JLKSportRankListViewController alloc] init];
    [self.navigationController pushViewController:rankVC animated:YES];
}

/**
 *  设置顶部的标签栏
 */
- (void)setupTitlesView {
    // 标签栏整体
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    titlesView.width = SQScreenW;
    titlesView.y = SQTitlesViewY + JLKStepViewH;
    titlesView.height = SQTitlesViewH;
    // 导致里面的子控件也会成为半透明，不建议使用
    //    titlesView.alpha = 0.5;
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    // 底部的红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = titlesView.height - indicatorView.height;
    self.indicatorView = indicatorView;
    
    // 内部子标签
    CGFloat width = titlesView.width / self.childViewControllers.count;
    CGFloat height = titlesView.height;
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        button.height = height;
        button.width = width;
        button.x = i * width;
        UIViewController *vc = self.childViewControllers[i];
        [button setTitle:vc.title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:button];
        
        // 默认点击了第一个按钮
        if (0 == i) {
            button.enabled = NO;
            self.selectedBtn = button;
            
            // 让按钮内部的label根据文字内容来计算尺寸
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width;
            self.indicatorView.centerX = button.centerX;
        }
    }
    
    [titlesView addSubview:indicatorView];
}

- (void)titleClick:(UIButton *)button {
    // 修改按钮状态
    self.selectedBtn.enabled = YES;
    button.enabled = NO;
    self.selectedBtn = button;
    
    [UIView animateWithDuration:.25 animations:^{
        self.indicatorView.width = button.titleLabel .width;
        self.indicatorView.centerX = button.centerX;
    }];
    
    // 滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}

/**
 *  设置导航栏
 */
- (void)setupNav {
    // 设置导航栏内容
    self.navigationItem.title = @"运动";
    
    // 设置背景色
    self.view.backgroundColor = SQGlobalBkg;
}

#pragma mark -<UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    // 当前索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    // 取出子控制器
    UIViewController *VC = self.childViewControllers[index];
    VC.view.x = scrollView.contentOffset.x;
    VC.view.y = 0; // 设置控制器的view的y值为0(默认是20)
    VC.view.height = scrollView.height; // 设置控制器view的height值为整个屏幕的高度(默认是比屏幕高度少个20)
    [scrollView addSubview:VC.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titlesView.subviews[index]];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    for (UITableViewController *tableVC in self.childViewControllers) {
        [tableVC.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end