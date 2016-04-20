//
//  SQHomeMenuViewController.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/19.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SQHomeMenuViewControllerDelegate <NSObject>

@optional
- (void)showTopic:(int)index;

@end

@interface SQHomeMenuViewController : UITableViewController

@property (nonatomic, weak) id<SQHomeMenuViewControllerDelegate> delegate;

@end
