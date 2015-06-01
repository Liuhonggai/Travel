//
//  HomeViewCell.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeWeek.h"
#import "ImageDownload.h"

@interface HomeViewCell : UITableViewCell<ImageDownloadDelegate>



@property (nonatomic , strong)UIImageView * imgView;

@property (nonatomic , strong)UILabel * titleLabel;

@property (nonatomic , strong)UILabel * disLabel;

@property (nonatomic , strong)UILabel * pLabel;

@property (nonatomic , strong)UILabel * addrLabel;
@property (nonatomic, strong)NSString * homeId;

//@property (nonatomic , strong)UIButton * follow_num;


@property (nonatomic , strong)HomeWeek * homeWeek;
@end
