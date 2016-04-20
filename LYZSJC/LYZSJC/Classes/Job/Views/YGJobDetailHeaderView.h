//
//  YGJobDetailHeaderView.h
//  LYZSJC
//
//  Created by Lovecx on 16/4/19.
//  Copyright © 2016年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGJobDetailHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *user_image;
@property (weak, nonatomic) IBOutlet UILabel *user_name;
@property (weak, nonatomic) IBOutlet UILabel *time_label;
@property (weak, nonatomic) IBOutlet UIButton *like_button;
@property (weak, nonatomic) IBOutlet UILabel *commits;

//@property (nonatomic, assign) CGFloat height_label;

- (void)assignment;

@end
