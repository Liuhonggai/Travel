//
//  PayTableViewController.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "PayTableViewController.h"
#import "URLHeaders.h"
#import "PayViewCell.h"
#import "TopTableViewCell.h"
#import "DetailViewController.h"
@interface PayTableViewController ()

@end

@implementation PayTableViewController
- (void)loadView
{
    [super loadView];
     self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
}
- (void)viewWillAppear:(BOOL)animated
{
   // [super viewWillAppear:YES];
     self.navigationItem.title = @"我要参加";
    self.view.backgroundColor = [UIColor whiteColor];
    
  
    
    UIBarButtonItem * blackItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_blue"] style:UIBarButtonItemStylePlain target:self action:@selector(blackItem)];
    self.navigationItem.leftBarButtonItem = blackItem;
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, main_wight, main_hight) style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    
    UIView * footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, main_wight, 80)];
    footView.backgroundColor = [UIColor colorWithWhite:0.949 alpha:1.000];
//    tableView.tableFooterView = [[UIView alloc] init];//去掉多余的cell
    tableView.tableFooterView = footView;
    UIButton * footButton = [UIButton buttonWithType:UIButtonTypeCustom];
    footButton.frame = CGRectMake(30, 20, main_wight-60, 40);
    footButton.backgroundColor = [UIColor colorWithRed:0.902 green:0.227 blue:0.165 alpha:1.000];
    [footButton setTitle:@"提交订单" forState:UIControlStateNormal];
    [footButton addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:footButton];
     footButton.layer.cornerRadius = 15;
    [self.view addSubview:tableView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)blackItem
{
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"touming"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage alloc]];
    
  
    [self.navigationController popViewControllerAnimated:YES];
    
}

/**
 *  提交订单
 *
 *  @param sender
 */
- (void)present:(UIButton *)sender
{
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"订单提交" message:@"你有钱吗？" delegate:self cancelButtonTitle:@"没钱" otherButtonTitles:@"有钱", nil];
    alertView.delegate = self;
    [alertView show];
}
//警告窗代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSLog(@"ddd");
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if(section == 1 ){
        return 1;
    }else if(section == 2){
        return 3;
    }else
        return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.backgroundColor= [UIColor colorWithWhite:0.961 alpha:1.000];
    if (indexPath.section == 0) {
        return 120;
    }else
        return 50;
   
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray * arry = @[@"预定信息",@"预定日期",@"预订人",@"支付方式"];
    
    return [arry objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopTableViewCell * topCell = [tableView dequeueReusableCellWithIdentifier:@"topCell"];
    PayViewCell * payCell = [tableView dequeueReusableCellWithIdentifier:@"payCell"];
    if (indexPath.section == 0) {
        
        if (!topCell) {
            topCell  = [[TopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"topCell"];
            topCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        topCell.detail = self.detail;
        return topCell;
    }else
    if (!payCell) {
        payCell = [[PayViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"payCell"];
    }
        return payCell;
    
    
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
