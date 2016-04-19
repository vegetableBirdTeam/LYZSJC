//
//  NSDate+SystemTimeZone.h
//  Pedomet
//
//  Created by zero on 16/4/19.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SystemTimeZone)

+ (NSDate *)systemTimeZoneWithDate:(NSDate *)date;

@end
