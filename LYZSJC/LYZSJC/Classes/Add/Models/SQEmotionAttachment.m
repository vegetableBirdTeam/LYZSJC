//
//  SQEmotionAttachment.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/22.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQEmotionAttachment.h"
#import "SQEmotion.h"

@implementation SQEmotionAttachment

- (void)setEmotion:(SQEmotion *)emotion
{
    _emotion = emotion;
    
    self.image = [UIImage imageNamed:emotion.png];
}

@end
