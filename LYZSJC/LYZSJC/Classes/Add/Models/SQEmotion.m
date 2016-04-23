//
//  SQEmotion.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/22.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQEmotion.h"
#import <MJExtension.h>

@interface SQEmotion ()<NSCoding>

@end

@implementation SQEmotion

/**
 *  归档的实现
 */
MJCodingImplementation

- (BOOL)isEqual:(SQEmotion *)emotion {
    return [self.chs isEqualToString:emotion.chs] || [self.code isEqualToString:emotion.code];
}

@end
