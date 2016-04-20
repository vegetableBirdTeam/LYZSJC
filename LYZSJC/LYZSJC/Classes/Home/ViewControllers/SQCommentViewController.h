//
//  SQCommentViewController.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/19.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQTopic;

@interface SQCommentViewController : UIViewController

/** 帖子模型 */
@property (nonatomic, strong) SQTopic *topic;

@end
