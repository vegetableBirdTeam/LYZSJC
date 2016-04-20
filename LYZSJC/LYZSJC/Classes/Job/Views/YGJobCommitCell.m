//
//  YGJobCommitCell.m
//  LYZSJC
//
//  Created by Lovecx on 16/4/20.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "YGJobCommitCell.h"

@implementation YGJobCommitCell

- (void)setData {
    self.userImage.backgroundColor = [UIColor blueColor];
    
    self.userImage.layer.cornerRadius = self.userImage.size.width / 2;
    self.userImage.layer.masksToBounds = YES;
    
    [self.likeButton setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
    [self.likeButton setTitle:@"10" forState:UIControlStateNormal];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
