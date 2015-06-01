//
//  SearcherViewCell.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeListTwo.h"

@interface SearcherViewCell : UITableViewCell

@property(nonatomic , strong )UIImageView * imgV;

@property(nonatomic , strong)UILabel * typeLabel;

@property(nonatomic , strong)HomeListTwo * homelist;
@end
