//
//  JLKPedometer.h
//  Pedomet
//
//  Created by zero on 16/4/19.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreMotion;

@interface JLKPedometer : NSObject

typedef void (^UseStep) (CMPedometerData * _Nullable pedometerData, NSError * _Nullable error);

/** 根据时间计算步数 */
- (void)stepFromDate:(NSDate * _Nonnull)startTime toDate:(NSDate * _Nullable)endTime withHandler:(UseStep _Nonnull)handler;

/** 计算今天的步数 从0时0分0秒开始*/
- (void)stepFromTodayWithHandler:(UseStep _Nonnull)handler;

@end
