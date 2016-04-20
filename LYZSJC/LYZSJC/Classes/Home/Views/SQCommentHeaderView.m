//
//  SQCommentHeaderView.m
//  LYZSJC
//
//  Created by 沈强 on 16/4/19.
//  Copyright © 2016年 SQ. All rights reserved.
//

#import "SQCommentHeaderView.h"

@interface SQCommentHeaderView ()

/** 文字标签 */
@property (nonatomic, weak) UILabel *label;

@end

@implementation SQCommentHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView {
    static NSString *ID = @"header";
    SQCommentHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[SQCommentHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return header;
}

//- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
//    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
//        self.contentView.backgroundColor = SQGlobalBkg;
//        
//        // 创建label
//        UILabel *label = [[UILabel alloc] init];
////        label.textColor = SQrg
//    }
//}

@end
