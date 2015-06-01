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
#import "HomeWeek.h"
#import "NetworkHandler.h"
@interface HomeTableViewController ()

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.title = @"周末";

    self.leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"1.png"] style:UIBarButtonItemStyleDone target:self action:@selector(clicked:)];
    self.navigationItem.leftBarButtonItem = _leftBtn;
    
    UIBarButtonItem *rightBt = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"1.png"] style:UIBarButtonItemStyleDone target:self action:@selector(searching:)];
    self.navigationItem.rightBarButtonItem = rightBt;
    
    
    __weak HomeTableViewController * homeTVC = self;
    
    NetworkHandler * handle = [[NetworkHandler alloc]init];
    NSURL * url = [NSURL URLWithString:News_URL];
    [handle getHomeListWithURL:url competion:^(id list) {
        
        homeTVC.homeList = list;
        //   NSLog(@"++++%@",self.homeList);
        
        [homeTVC.tableView reloadData];
        
    }];
    
       
}

//点击方法
- (void)sphereDidSelected:(int)index
{
    NSLog(@"sphere %d selected", index);
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}






- (void)clicked:(UIBarButtonItem *)nar
{
    LeftViewController *left = [[LeftViewController alloc] init];
    DDMenuController *dd = [[DDMenuController alloc] init];
    dd.delegate = self;
    [self menuController:dd willShowViewController:left];
}
- (void)menuController:(DDMenuController*)controller willShowViewController:(UIViewController*)controller1
{
    [controller showLeftController:YES];
}

-(void)searching:(UIBarButtonItem *)nar
{
    
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeWeek * home = [_homeList objectAtIndex:indexPath.row];
    
    if (indexPath.row % 2 == 0)
    {
        
        HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
        if (cell == nil)
        {
            cell = [[HomeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
        }
        cell.selectionStyle = NO;
        
        
        
        cell.homeWeek = home;
        
        return cell;
    }else
    {
        
        ScrollViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AA"];
        if (cell == nil)
        {
            cell = [[ScrollViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AA"];
        }
        cell.selectionStyle = NO;
        
        cell.homeWeek = home;
        
        return cell;
        
    }
    
    return nil;
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
