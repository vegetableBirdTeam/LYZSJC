//
//  YGCategoryTableViewCell.h
//  LYZSJC
//
//  Created by Lovecx on 16/4/18.
//  Copyright © 2016年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGCategoryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *category_name; // 分类
@property (weak, nonatomic) IBOutlet UIImageView *cutLine;   // 分割线

@end
