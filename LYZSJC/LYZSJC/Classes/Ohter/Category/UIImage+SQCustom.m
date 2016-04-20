//
//  UIImage+SQCustom.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/20.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import "UIImage+SQCustom.h"

@implementation UIImage (SQCustom)

- (UIImage *)circleImage {
    // NO代表透明
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 将图片画上去
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithName:(NSString *)name {
    NSString *dir = [[NSUserDefaults standardUserDefaults] stringForKey:@"SKinDirName"];
    NSString *path = [NSString stringWithFormat:@"SKins/%@/%@", dir, name];
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:path ofType:nil]];
}

@end
