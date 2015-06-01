//
//  HomeTableViewController.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeListTwo.h"


@interface HomeTableViewController : UITableViewController

@property(nonatomic , strong)NSArray * homeList;

@property(nonatomic , strong)NSArray * listArray;

//@property(nonatomic , strong)UITableView * tableView;

@property(nonatomic,assign)int pageSize;


@property (nonatomic, strong)HomeListTwo * two;
@end
