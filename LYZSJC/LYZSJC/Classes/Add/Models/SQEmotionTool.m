//
//  SQEmotionTool.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/22.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQEmotionTool.h"
#import "SQEmotion.h"

@implementation SQEmotionTool

static NSMutableArray *_recentEmotions;

/**
 *  第一次使用时调用
 */
+ (void)initialize
{
    // 解档
    _recentEmotions = [NSKeyedUnarchiver unarchiveObjectWithFile:SQRecentEmotionsPath];
    if (_recentEmotions == nil) {
        _recentEmotions = [NSMutableArray array];
    }
}

/** 
 *  添加最近使用的表情 
 */
+ (void)addRecentEmotion:(SQEmotion *)emotion {
    // 删除重复的表情
    [_recentEmotions removeObject:emotion];
    // 将表情放到数组最前面
    [_recentEmotions insertObject:emotion atIndex:0];
    // 将所有的表情数据写入沙盒
    [NSKeyedArchiver archiveRootObject:_recentEmotions toFile:SQRecentEmotionsPath];
}

/**
 *  返回表情模型数组
 */
+ (NSArray *)recentEmotions {
    return _recentEmotions;
}

@end
