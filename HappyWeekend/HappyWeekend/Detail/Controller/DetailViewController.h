//
//  DetailViewController.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Detail.h"
#import "HomeListTwo.h"
@interface DetailViewController : UIViewController
@property (nonatomic, strong)NSMutableArray * detailList;
@property (nonatomic, strong)UITableView *detailTV;
@property (nonatomic,strong)Detail *deta;

@property (nonatomic, strong)HomeListTwo * homeLostTwo;
@property (nonatomic, strong)UIImageView * testView;
@property (nonatomic, strong)UIActivityIndicatorView * activityIV;

@property (nonatomic, strong)UIActivityIndicatorView * chrysanthemum;

@property (nonatomic, assign)int ID;
@end
