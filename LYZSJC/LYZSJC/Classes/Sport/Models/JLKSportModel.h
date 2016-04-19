//
//  JLKSprotModel.h
//  LYZSJC
//
//  Created by zero on 16/4/18.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLKSportModel : NSObject

@property (nonatomic, copy) NSString *article_url;
@property (nonatomic, copy) NSString *cover_img;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *sub_title;
@property (nonatomic, strong) NSNumber *subject_id;
@property (nonatomic, copy) NSString *view_cnt;

@end
