//
//  SQComment.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/19.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQUser.h"

@interface SQComment : NSObject

/** id */
@property (nonatomic, copy) NSString *ID;
/** 音频文件的时长 */
@property (nonatomic, assign) NSInteger voicetime;
/** 音频文件的路径 */
@property (nonatomic, copy) NSString *voiceuri;
/** 评论的文字内容 */
@property (nonatomic, copy) NSString *content;
/** 被点赞的数量 */
@property (nonatomic, assign) NSInteger like_count;
/** 用户 */
@property (nonatomic, strong) SQUser *user;

@end
