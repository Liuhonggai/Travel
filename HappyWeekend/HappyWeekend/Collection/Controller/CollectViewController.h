//
//  CollectViewController.h
//  HappyWeekend
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (nonatomic, strong)UITableView * tableView;


@property(nonatomic,strong)NSMutableArray *array;
@end