//
//  JLKPedometer.m
//  Pedomet
//
//  Created by zero on 16/4/19.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "JLKPedometer.h"

/** 不要问我为什么, 不定义全局就会出错 */
static CMPedometer *pedometer = nil;

@interface JLKPedometer ()

/** 定义为属性防止被销毁 */
@property (nonatomic, copy) _Nonnull UseStep useStep;

@end

@implementation JLKPedometer

- (instancetype)init
{
    self = [super init];
    if (self) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            pedometer = [[CMPedometer alloc] init];
        });
    }
    return self;
}

/** 根据时间计算步数 */
- (void)stepFromDate:(NSDate * _Nonnull)startTime toDate:(NSDate * _Nullable)endTime withHandler:(UseStep _Nonnull)handler
{
    self.useStep = handler;
    if ([CMPedometer isStepCountingAvailable]) {
        if (endTime) {
            [pedometer queryPedometerDataFromDate:[NSDate systemTimeZoneWithDate:startTime] toDate:[NSDate systemTimeZoneWithDate:endTime] withHandler:self.useStep];
        } else {
            [pedometer startPedometerUpdatesFromDate:[NSDate systemTimeZoneWithDate:startTime] withHandler:self.useStep];
        }
    } else {
        NSLog(@"设备不支持记步功能");
    }
}

/** 计算今天的步数 从0时0分0秒开始*/
- (void)stepFromTodayWithHandler:(UseStep _Nonnull)handler
{
    self.useStep = handler;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *stringDate = [formatter stringFromDate:[NSDate date]];
    NSDate *date = [formatter dateFromString:stringDate];
    
    [self stepFromDate:date toDate:nil withHandler:self.useStep];
}

@end
