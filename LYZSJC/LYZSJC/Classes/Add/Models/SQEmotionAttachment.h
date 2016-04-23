//
//  SQEmotionAttachment.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/22.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQEmotion;

@interface SQEmotionAttachment : NSTextAttachment

/** 表情模型 */
@property (nonatomic, strong) SQEmotion *emotion;

@end
