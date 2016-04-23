//
//  JLKUserInfo.h
//  LYZSJC
//
//  Created by zero on 16/4/22.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLKUserInfo : NSObject

/** 头像地址 */
@property (nonatomic, copy) NSString *iconUrl;
/** 用户昵称 */
@property (nonatomic, copy) NSString *username;
/** 用户性别 */
@property (nonatomic, copy) NSString *gender;
/** 关注数量 */
@property (nonatomic, strong) NSNumber *focusCnt;
/** 收藏数量 */
@property (nonatomic, strong) NSNumber *collectCnt;
/** 粉丝数量 */
@property (nonatomic, strong) NSNumber *fansCnt;

@end
