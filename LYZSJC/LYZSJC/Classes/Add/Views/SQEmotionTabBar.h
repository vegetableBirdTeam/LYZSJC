//
//  SQQEmotionTabBar.h
//  LYZSJC
//
//  Created by 沈强 on 16/4/22.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQEmotionTabBar;

@protocol SQEmotionTabBarDelegate <NSObject>

@optional
- (void)emotionTabBar:(SQEmotionTabBar *)tabBar didSelectButton:(SQEmotionTabBarButtonType)type;

@end

@interface SQEmotionTabBar : UIView

/** 代理 */
@property (nonatomic, weak) id<SQEmotionTabBarDelegate> delegate;

@end
