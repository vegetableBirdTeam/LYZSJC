//
//  YGJobCommitCell.h
//  LYZSJC
//
//  Created by Lovecx on 16/4/20.
//  Copyright © 2016年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGJobCommitCell : UITableViewCell

/**用户头像*/
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
/**用户名称*/
@property (weak, nonatomic) IBOutlet UILabel *userName;
/**点赞*/
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
/**内容*/
@property (weak, nonatomic) IBOutlet UILabel *content;

- (void)setData;

@end
