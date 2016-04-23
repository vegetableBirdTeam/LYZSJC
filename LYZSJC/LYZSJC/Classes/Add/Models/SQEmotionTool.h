//
//  SQEmotionTool.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/22.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SQEmotion;

@interface SQEmotionTool : NSObject

/** 添加最近使用的表情 */
+ (void)addRecentEmotion:(SQEmotion *)emotion;
/** 最近表情数组 */
+ (NSArray *)recentEmotions;

@end
