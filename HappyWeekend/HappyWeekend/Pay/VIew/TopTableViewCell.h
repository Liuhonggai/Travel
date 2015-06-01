//
//  TopTableViewCell.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Detail.h"
@interface TopTableViewCell : UITableViewCell
@property (nonatomic, strong)UIImageView * photoView;
@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UILabel * address;

@property (nonatomic, strong)Detail * detail;
@end
