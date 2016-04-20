//
//  UIImageView+SQCustom.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/20.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import "UIImageView+SQCustom.h"
#import <UIImageView+WebCache.h>
#import "UIImage+SQCustom.h"

@implementation UIImageView (SQCustom)

- (void)setHeader:(NSString *)url {
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image ? [image circleImage] : placeholder;
    }];
}

@end
