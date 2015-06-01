//
//  SettingTableViewController.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "SettingTableViewController.h"
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
    self.arr2 = @[@"",@"常规",@"支持我们",@"关于"];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.scrollEnabled = NO;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 64;
    }
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else if(section == 1)
    {
        return 1;
    }else if(section == 2){
        return 2;
    }else if (section == 3){
        return 1;
    }else
        return 0;
    
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
    
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor colorWithRed:0.393 green:1.000 blue:0.908 alpha:1.000];
    headerLabel.highlightedTextColor = [UIColor whiteColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:14];
    headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 44.0);
    
    if (section == 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        button.frame = CGRectMake(10, 20, 44, 44);
        [self.view addSubview:button];
        [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 setTitle:@"设置" forState:UIControlStateNormal];
        button1.frame = CGRectMake(self.view.frame.size.width/2- 22, 20, 44, 44);
        [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:button1];
        
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 1)];
        view1.alpha = 0.30;
        view1.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:view1];
    }else if (section == 1){
        headerLabel.text = [self.arr2 objectAtIndex:1];
    }else if (section == 2){
        headerLabel.text = [self.arr2 objectAtIndex:2];
    }else if (section == 3){
        headerLabel.text = [self.arr2 objectAtIndex:3];
    }
    [customView addSubview:headerLabel];
    
    return customView;
    
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
    cell.backgroundColor = [UIColor colorWithRed:0.219 green:0.992 blue:0.158 alpha:0.30];
    if (indexPath.section == 1) {
        cell.textLabel.text = self.srr[indexPath.row];
    }else if(indexPath.section == 2)
    {
        cell.textLabel.text = self.arr[indexPath.row];
    }else if(indexPath.section == 3)
    {
        cell.textLabel.text = self.arr1[indexPath.row];
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1 && indexPath.section == 3) {
#warning 打电话
        UIWebView*callWebview =[[UIWebView alloc] init];
        NSURL *telURL =[NSURL URLWithString:@"tel://400-100-8888"];
        [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
        //记得添加到view上
        [self.view addSubview:callWebview];
    }else if(indexPath.section == 2 && indexPath.row == 1)
    {
#warning 第三方登陆
        [self share];
    }
    
}

- (void)share
{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"556972a467e58e403a006308"
                                      shareText:@"你要分享的文字"
                                     shareImage:[UIImage imageNamed:@"1.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToDouban,nil]
                                       delegate:nil];
    
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
