//
//  DetailTableViewCell.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Detail.h"
#import "UITableViewCell+textHeight.h"
@interface DetailTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel * timeLabel;
@property (nonatomic, strong)UILabel * content;


@property (nonatomic, assign)CGFloat content_height;
@property (nonatomic, strong)UILabel * tips_show_label;
- (void)setCellWithDetail:(Detail *)deta;
@end
