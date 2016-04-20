//
//  SQTopicVoiceView.h
//  baisibudejie
//
//  Created by 沈强 on 16/4/12.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQTopic.h"

@interface SQTopicVideoView : UIView

/** 帖子数据 */
@property (nonatomic, strong) SQTopic *topic;

+ (instancetype)videoView;

@end
