//
//  SQCommentCell.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/20.
//  Copyright © 2016年 JLK. All rights reserved.
//

#import "SQCommentCell.h"
#import "UIImageView+SQCustom.h"
#import "SQUser.h"

@interface SQCommentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *sexView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *voiceButton;

@end

@implementation SQCommentCell

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return NO;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    self.backgroundView = bgView;
}

- (void)setComment:(SQComment *)comment {
    _comment = comment;
    
    [self.profileImageView setHeader:comment.user.profile_image];
    
    self.sexView.image = [comment.user.sex isEqualToString:SQUserSexMale] ? [UIImage imageNamed:@"Profile_manIcon"] : [UIImage imageNamed:@"Profile_womanIcon"];
    self.contentLabel.text = comment.content;
    self.usernameLabel.text = comment.user.username;
    self.likeCountLabel.text = [NSString stringWithFormat:@"%zd", comment.like_count];
    
    if (comment.voiceuri) {
        self.voiceButton.hidden = NO;
        [self.voiceButton setTitle:[NSString stringWithFormat:@"%zd''", comment.voicetime] forState:UIControlStateNormal];
    } else {
        self.voiceButton.hidden = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
