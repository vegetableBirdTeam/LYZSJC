//
//  NSDate+SystemTimeZone.m
//  Pedomet
//
//  Created by zero on 16/4/19.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "NSDate+SystemTimeZone.h"

@implementation NSDate (SystemTimeZone)

/** 转换时间为本地时区 */
+ (NSDate *)systemTimeZoneWithDate:(NSDate *)date
{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSTimeInterval interval = [zone secondsFromGMTForDate:date];
    NSDate *systemTimeZoneDate = [date dateByAddingTimeInterval:(double)interval];
    
    return systemTimeZoneDate;
}

@end
