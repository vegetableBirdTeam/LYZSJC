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

/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
/** 性别 */
@property (weak, nonatomic) IBOutlet UIImageView *sexView;
/** 评论内容 */
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
/** 用户名 */
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
/** 点赞数 */
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
/** 音频按钮 */
@property (weak, nonatomic) IBOutlet UIButton *voiceButton;
/** 评论时间 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


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
    
    if (!comment.voiceuri) {
        self.voiceButton.hidden = NO;
        [self.voiceButton setTitle:[NSString stringWithFormat:@"%zd''", comment.voicetime] forState:UIControlStateNormal];
    } else {
        self.voiceButton.hidden = YES;
    }
    
    self.timeLabel.text = @"几分钟前";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
