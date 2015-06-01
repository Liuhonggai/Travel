//
//  HomeTableViewController.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDMenuController.h"
#import "LeftViewController.h"

@interface HomeTableViewController : UITableViewController<DDMenuControllerDelegate>

@property(nonatomic , strong)NSArray * homeList;

<<<<<<< HEAD

@property(nonatomic, strong)NSString * homeId;
=======
@property (nonatomic ,strong) UIBarButtonItem *leftBtn;
>>>>>>> 1a73185bb2fbda1045cae3d443054156672a778d

@end
