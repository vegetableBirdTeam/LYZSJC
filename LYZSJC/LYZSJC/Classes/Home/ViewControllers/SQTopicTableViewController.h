//
//  SQTableViewController.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/18.
//  Copyright © 2016年 SQ. All rights reserved.
//  最基本的帖子控制器

#import <UIKit/UIKit.h>

@interface SQTopicTableViewController : UITableViewController

/** 帖子的类型 */
@property (nonatomic, assign) SQTopicType type;

@end
