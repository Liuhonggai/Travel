//
//  SettingTableViewController.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "SettingTableViewController.h"
//#import "LeftViewController.h"
@interface SettingTableViewController ()

@property (nonatomic ,strong) NSArray *srr;
@property (nonatomic ,strong) NSArray *arr;
@property (nonatomic ,strong) NSArray *arr1;
@property (nonatomic ,strong) NSArray *arr2;
@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    self.view.backgroundColor = [UIColor redColor];
    
   
    self.srr = @[@"清除浏览缓存"];
    self.arr = @[@"给我们意见",@"分享APP给好友"];
    self.arr1 = @[@"联系我们"];
    self.arr2 = @[@"常规",@"支持我们",@"关于"];

    self.tableView.tableFooterView = [[UIView alloc] init];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 100;
    }
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if(section == 1)
    {
        return 2;
    }else
        
        return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"back" forState:UIControlStateNormal];
        button.frame = CGRectMake(25, 25, 50, 50);
        button.backgroundColor = [UIColor blackColor];
        [self.view addSubview:button];
        [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    }
    return [self.arr2 objectAtIndex:section];
}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGPoint aaa = scrollView.contentOffset;
//    if (aaa.y < -64) {
//        scrollView.contentOffset = CGPointMake(aaa.x, -64);
//    }
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myCell = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myCell];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCell];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = self.srr[indexPath.row];
    }else if(indexPath.section == 1)
    {
        cell.textLabel.text = self.arr[indexPath.row];
    }else if(indexPath.section == 2)
    {
        cell.textLabel.text = self.arr1[indexPath.row];
    }
    
    return cell;
}

- (void)back:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
