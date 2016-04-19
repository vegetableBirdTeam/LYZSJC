//
//  SQTabBarController.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/14.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQTabBarController.h"
#import "SQHomeViewController.h"
#import "SQAddViewController.h"
#import "SQJobViewController.h"
#import "JLKSportViewController.h"
#import "SQMeViewController.h"
#import "SQTabBar.h"
#import "SQNavigationController.h"

@interface SQTabBarController ()

@end

@implementation SQTabBarController

/**
 *  当第一次使用这个类的时候调用
 */
+ (void)initialize {
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEANCE_SELECTOR的方法，都可以通过appearance对象来统一设置
    // 设置正常状态下的文字大小和文字颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12.0];
    attrs[NSForegroundColorAttributeName] = SQRGBColor(51, 71, 95);
    
    // 设置选中状态的文字与文字颜色
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12.0];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    // 通过appearence来设置所有的UITabBarItem文字大小与文字颜色
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    [self setupChildViewController:[[SQHomeViewController alloc] init] title:@"瞧瞧" image:@"home" selectedImage:@"homeClick"];
    [self setupChildViewController:[[SQJobViewController alloc] init] title:@"兼职" image:@"job" selectedImage:@"jobClick"];
    [self setupChildViewController:[[JLKSportViewController alloc] init] title:@"运动" image:@"sport" selectedImage:@"sportClick"];
    [self setupChildViewController:[[SQMeViewController alloc] init] title:@"我" image:@"me" selectedImage:@"meClick"];
    
    // 更换tabBar
    [self setValue:[[SQTabBar alloc] init] forKeyPath:@"tabBar"];
}

/**
 *  初始化控制器
 */
- (void)setupChildViewController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    // 设置文字和图片
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 包装导航控制器，添加导航控制器tabBarController为子控制器
    SQNavigationController *navigationController = [[SQNavigationController alloc] initWithRootViewController:viewController];
    
    // 添加子控制器
    [self addChildViewController:navigationController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
