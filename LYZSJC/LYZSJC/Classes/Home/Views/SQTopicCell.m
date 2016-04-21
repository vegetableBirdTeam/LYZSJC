//
//  SQTopicCell.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/7.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQTopicCell.h"
#import "SQTopicPictureView.h"
#import "SQTopicVoiceView.h"
#import "SQTopicVideoView.h"
#import <UIImageView+WebCache.h>

@interface SQTopicCell ()

/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
/** 昵称 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 时间 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
/** 顶 */
@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
/** 踩 */
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
/** 分享 */
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
/** 评论 */
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
/** 新浪加V */
@property (weak, nonatomic) IBOutlet UIImageView *sinaVView;
/** 帖子的文字内容 */
@property (weak, nonatomic) IBOutlet UILabel *text_Label;
/** 图片帖子中间的内容 */
@property (nonatomic, weak) SQTopicPictureView *pictureView;
/** 声音帖子中间的内容 */
@property (nonatomic, weak) SQTopicVoiceView *voiceView;
/** 视频帖子中间的内容 */
@property (nonatomic, weak) SQTopicVideoView *videoView;

@end

@implementation SQTopicCell

- (SQTopicPictureView *)pictureView {
    if (!_pictureView) {
        SQTopicPictureView *pictureView = [SQTopicPictureView pictureView];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
    }
    return _pictureView;
}

- (SQTopicVoiceView *)voiceView {
    if (!_voiceView) {
        SQTopicVoiceView *voiceView = [SQTopicVoiceView voiceView];
        [self.contentView addSubview:voiceView];
        _voiceView = voiceView;
    }
    return _voiceView;
}

- (SQTopicVideoView *)videoView {
    if (!_videoView) {
        SQTopicVideoView *videoView = [SQTopicVideoView videoView];
        [self.contentView addSubview:videoView];
        _videoView = videoView;
    }
    return _videoView;
}

- (void)awakeFromNib {
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView = bgView;
}

- (void)setTopic:(SQTopic *)topic {
    _topic = topic;
    
    // 新浪加V
    self.sinaVView.hidden = !topic.isSina_v;
    
    // 设置头像
    [self.profileImageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    // 设置名字
    self.nameLabel.text = topic.name;
    
    // 设置帖子的创建时间
    self.timeLabel.text = topic.create_time;
    
    // 设置按钮文字
    [self setupButtonTitle:self.dingBtn count:topic.ding placeholder:@"顶"];
    [self setupButtonTitle:self.caiBtn count:topic.cai placeholder:@"踩"];
    [self setupButtonTitle:self.shareBtn count:topic.repost placeholder:@"分享"];
    [self setupButtonTitle:self.commentBtn count:topic.comment placeholder:@"评论"];
    
    // 设置帖子的文字内容
    self.text_Label.text = topic.text;
    
    // 根据模型类型(帖子类型)添加对应的内容到cell的中间
    if (topic.type == SQTopicTypePicture) { // 图片帖子
        self.pictureView.hidden = NO;
        self.pictureView.topic = topic;
        self.pictureView.frame = topic.pictureF;
        
        self.voiceView.hidden = YES;
        self.videoView.hidden = YES;
    } else if (topic.type == SQTopicTypeVoice) { // 声音帖子
        self.voiceView.hidden = NO;
        self.voiceView.topic = topic;
        self.voiceView.frame = topic.voiceF;
        
        self.pictureView.hidden = YES;
        self.videoView.hidden = YES;
    } else if (topic.type == SQTopicTypeVideo) { // 视频帖子
        self.videoView.hidden = NO;
        self.videoView.topic = topic;
        self.videoView.frame = topic.videoF;
        
        self.pictureView.hidden = YES;
        self.voiceView.hidden = YES;
    } else { // 段子帖子
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
        self.pictureView.hidden = YES;
    }
}

/**
 *  设置底部按钮文字
 */
- (void)setupButtonTitle:(UIButton *)button count:(NSInteger)count placeholder:(NSString *)placeholder {
    if (count > 10000) {
        placeholder = [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    } else if (count > 0) {
        placeholder = [NSString stringWithFormat:@"%zd", count];
    }
    [button setTitle:placeholder forState:UIControlStateNormal];
}

- (void)setFrame:(CGRect)frame {
//    frame.origin.x = SQTopicCellMargin;
//    frame.size.width -= 2 * SQTopicCellMargin;
    frame.size.height -= SQTopicCellMargin;
    frame.origin.y += SQTopicCellMargin;
    
    [super setFrame:frame];
}

@end
