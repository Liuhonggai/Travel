//
//  CollectViewController.m
//  HappyWeekend
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CollectViewController.h"
#import "URLHeaders.h"
#import "CollectTableViewCell.h"
#import "Home_DB.h"
#import "HomeListTwo.h"
#import "MBProgressHUD.h"
#import "URLHeaders.h"
@interface CollectViewController ()

@end

@implementation CollectViewController
- (void)setNavigation
{
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_blue"]  style:UIBarButtonItemStylePlain target:self action:@selector(back_Item)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.navigationItem.title = @"收藏";
    
    //    UIBarButtonItem * deleteItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(deleteItem)];
    //    self.navigationItem.rightBarButtonItem = deleteItem;
    
    
}

- (void)addtableView
{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, main_wight, main_hight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    
    
    
    [self addSearch];
    
    [self.view addSubview:_tableView];
    
}
- (void)addSearch
{
    UISearchBar * search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 50, main_wight-100, 50)];
    search.placeholder = @"搜索已搜藏的活动";
    search.delegate = self;
    search.showsCancelButton = YES;
    _tableView.tableHeaderView = search;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self addtableView];
    [self setNavigation];
    
}
//搜索代理方法
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    
    [searchBar resignFirstResponder];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSMutableArray * arry = [Home_DB homes] ;
    self.array = [NSMutableArray arrayWithArray:arry];
    [self.array removeAllObjects];
     [Home_DB search:searchText];
    [self.tableView reloadData];
}


- (void)back_Item
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Home_DB homes].count ;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(main_wight/2, 30, main_wight, 100)];
    label.font = [UIFont systemFontOfSize:20.0];
    label.text = @"~~~end~~~";
    // label.backgroundColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectTableViewCell * collectCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (collectCell == nil) {
        collectCell = [[CollectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    collectCell.selectionStyle =UITableViewCellSelectionStyleNone;
    HomeListTwo * homeTwo =   [Home_DB homes][indexPath.row];
    collectCell.label.text = homeTwo.title;
    
    
    
    return collectCell;
}

//可编辑的
-(void)deleteItem
{
    [self.tableView endEditing:YES];
}
//编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
//可编辑的行数
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


//编辑可删除的cell
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    ;
    [Home_DB deleteHome:[[Home_DB homes] objectAtIndex:indexPath.row]];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
