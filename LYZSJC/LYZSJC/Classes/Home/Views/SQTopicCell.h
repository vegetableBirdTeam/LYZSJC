//
//  SQTopicCell.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/7.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQTopic.h"

@interface SQTopicCell : UITableViewCell

/** 帖子数据 */
@property (nonatomic, strong) SQTopic *topic;

@end
