//
//  UIBarButtonItem+SQCustom.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/15.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SQCustom)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
