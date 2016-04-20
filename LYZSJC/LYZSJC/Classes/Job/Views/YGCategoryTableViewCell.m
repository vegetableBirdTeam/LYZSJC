//
//  YGCategoryTableViewCell.m
//  LYZSJC
//
//  Created by Lovecx on 16/4/18.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "YGCategoryTableViewCell.h"

@implementation YGCategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    self.backgroundColor = SQGlobalBkg;
    self.cutLine.backgroundColor = SQGlobalBkg;
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // 设置未被选中时选中指示视图
    self.textLabel.textColor = selected ? self.cutLine.backgroundColor : SQGlobalBkg;
    
    // Configure the view for the selected state
}

@end
