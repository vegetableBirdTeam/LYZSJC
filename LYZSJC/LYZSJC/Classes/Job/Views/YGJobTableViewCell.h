//
//  YGJobTableViewCell.h
//  LYZSJC
//
//  Created by Lovecx on 16/4/18.
//  Copyright © 2016年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGJobTableModel.h"

@interface YGJobTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *user_image;
@property (weak, nonatomic) IBOutlet UILabel *user_name;
@property (weak, nonatomic) IBOutlet UILabel *commits;
@property (weak, nonatomic) IBOutlet UIButton *share_button;
@property (weak, nonatomic) IBOutlet UIButton *commit_button;
@property (weak, nonatomic) IBOutlet UIButton *like_button;
@property (weak, nonatomic) IBOutlet UILabel *time_label;

- (void)setDataWithModel:(YGJobTableModel *)data;

@end
