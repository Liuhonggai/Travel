//
//  ScrollViewCell.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDownload.h"
#import "HomeWeek.h"
@interface ScrollViewCell : UITableViewCell<UIScrollViewDelegate,ImageDownloadDelegate>

@property (nonatomic , strong)UIImageView * imgView;

@property (nonatomic , strong)UILabel * titleLabel;

@property (nonatomic , strong)UILabel * disLabel;

@property (nonatomic , strong)UILabel * pLabel;

@property (nonatomic , strong)UILabel * addrLabel;


//@property (nonatomic , strong)UIButton * follow_num;


@property (nonatomic , strong)HomeWeek * homeWeek;





//可滚动页面

@property (retain, nonatomic)UIScrollView * scrollView;

//页点

@property (retain, nonatomic)UIPageControl * pageControl;

//保存图片的数组

@property (retain, nonatomic) NSMutableArray *imageArray;
@end
