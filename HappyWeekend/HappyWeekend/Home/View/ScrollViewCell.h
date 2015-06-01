//
//  ScrollViewCell.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "HomeList.h"
@interface ScrollViewCell : UITableViewCell

@property(nonatomic , strong)UIImageView * imgView;
@property(nonatomic,strong)HomeList *homeList;
@property(nonatomic,strong)UIScrollView *scrollView;

@end