//
//  SQSportCell.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/18.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQSportCell.h"

@implementation SQSportCell

- (void)setModel:(JLKSportModel *)model
{
    _model = model;
    
    NSURL *url = [NSURL URLWithString:model.cover_img];
    [self.cover_imgImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"deemo"]];
    
    self.title_Label.text = model.title;
    
    self.sub_titleLabel.text = model.sub_title;
    
    NSInteger count = [model.view_cnt integerValue];
    NSString *placeholder = nil;
    if (count > 10000) {
        placeholder = [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    } else if (count > 0) {
        placeholder = [NSString stringWithFormat:@"%zd", count];
    }
    self.view_cntLabel.text = placeholder;
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
