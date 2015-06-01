//
//  HomeTableViewController.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//



#import "HomeTableViewController.h"
#import "HomeViewCell.h"
#import "ScrollViewCell.h"
#import "URLHeaders.h"
#import "NetworkHandler.h"
#import "MJRefresh.h"
#import "DetailViewController.h"
#import "HomeListTwo.h"
@interface HomeTableViewController ()

@property(nonatomic , strong)NSMutableArray * dataArray;

@end

@implementation HomeTableViewController

#pragma mark---------------下拉刷新--------------------
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0) {
        self.pageSize = 40;
        //下移加载坐标
        CGRect rect  = self.tableView.frame;
        rect.origin.y += 22;
        rect.size.height -= 22;
        self.tableView.frame = rect;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  addHeader];
    //运行时直接刷新数据
    [self.tableView.header beginRefreshing];
    
    
    self.navigationItem.title = @"周末";
    UIBarButtonItem *leftBt = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"1.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(click:)];
    self.navigationItem.leftBarButtonItem = leftBt;
    
    UIBarButtonItem *rightBt = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"1.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(searching:)];
    self.navigationItem.rightBarButtonItem = rightBt;
    
    
    
}

//添加一个方法
-(void)addHeader
{
    //处理循环引用问题
    __weak HomeTableViewController * homeVC = self;
    
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [homeVC refreshData];
    }];
    
}
//刷新数据
-(void)refreshData
{
    //缓存延迟过程（2秒）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //block接收在NetworkHandle回调的数据
        __weak HomeTableViewController * homeTVC = self;
        
        NetworkHandler * handle = [[NetworkHandler alloc]init];
        NSURL * url = [NSURL URLWithString:News_URL];
        [handle getHomeListWithURL:url competion:^(id list)
         {
             homeTVC.homeList = list;
            
             [homeTVC.tableView reloadData];
         }];
        //刷新tableView
        [self.tableView reloadData];
        //结束header刷新
        [self.tableView.header endRefreshing];
        
    });
}

-(NSMutableArray * )dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        
    }
    return _dataArray;
}


- (void)click:(UIBarButtonItem *)nar
{
    
}

-(void)searching:(UIBarButtonItem *)nar
{
    
    UISearchController * seacherVC = [[UISearchController alloc]init];
    
    [self.navigationController pushViewController:seacherVC animated:YES];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.homeList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.height*1/3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeList * homeList = [[HomeList alloc] init];
    HomeListTwo *homeListTwo = [[HomeListTwo alloc] init];
    HomeViewCell * homeViewCell = [tableView dequeueReusableCellWithIdentifier:@"homeViewCell"];
    ScrollViewCell *scrollViewCell = [tableView dequeueReusableCellWithIdentifier:@"scrollViewCell"];
    NSString * class = NSStringFromClass([[_homeList objectAtIndex:indexPath.row] class]);
    if ([class isEqualToString:@"HomeList"]) {
        homeList = [_homeList objectAtIndex:indexPath.row];
        if (scrollViewCell == nil) {
            scrollViewCell = [[ScrollViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"scrollViewCell"];
        }
        scrollViewCell.selectionStyle = NO;
        scrollViewCell.homeList = homeList;
        return scrollViewCell;
    }else{
        homeListTwo = [_homeList objectAtIndex:indexPath.row];
        if (homeViewCell == nil) {
            homeViewCell = [[HomeViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"homeViewCell"];
        }
        homeViewCell.selectionStyle = NO;
        homeViewCell.homeListTwo = homeListTwo;
        return homeViewCell;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController * detailVC = [[DetailViewController alloc] init];
    HomeListTwo * homeTwo = _homeList[indexPath.row];
//    detailVC.deta = homeTwo;
    detailVC.homeLostTwo = homeTwo;
   
    [self.navigationController pushViewController:detailVC animated:YES];
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
