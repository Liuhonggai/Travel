//
//  ScrollPhotoTableViewCell.h
//  UINAV
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Detail.h"
@interface ScrollPhotoTableViewCell : UITableViewCell

@property (nonatomic ,strong)UIPageControl * pageControl;
@property (nonatomic, strong)UIScrollView * photoScrollView;
@property (nonatomic, strong)UIButton * clickBtn;

@property (nonatomic, strong)UILabel * floatLabel;
@property (nonatomic, strong)UILabel * priceLabel;
@property (nonatomic, strong)Detail * deta;



@property (nonatomic, strong)UIImageView * scrollView_image;
@property (nonatomic, strong)NSMutableArray * imageArry;
@end
