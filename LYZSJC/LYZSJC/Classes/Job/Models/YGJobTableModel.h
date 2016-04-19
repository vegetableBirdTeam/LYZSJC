//
//  YGJobTableModel.h
//  LYZSJC
//
//  Created by Lovecx on 16/4/18.
//  Copyright © 2016年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGJobTableModel : NSObject

@property (nonatomic, strong) NSString *user_image;         // 用户头像
@property (nonatomic, strong) NSString *user_name;          // 用户名字
@property (nonatomic, strong) NSString *comments;           // 评论
@property (nonatomic, assign) NSInteger share_count;        // 分享
@property (nonatomic, assign) NSInteger comment_count;      // 评论次数
@property (nonatomic, assign) NSInteger like_count;         // 点赞

@end
