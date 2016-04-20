//
//  SQTopicPictureView.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/9.
//  Copyright © 2016年 SQ. All rights reserved.
//  图片帖子中间的内容

#import <UIKit/UIKit.h>
#import "SQTopic.h"

@interface SQTopicPictureView : UIView

/** 帖子数据 */
@property (nonatomic, strong) SQTopic *topic;

+ (instancetype)pictureView;

@end