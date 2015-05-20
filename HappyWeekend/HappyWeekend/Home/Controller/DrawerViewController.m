//
//  DrawerViewController.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "DrawerViewController.h"
#import "HomeTableViewController.h"

@interface DrawerViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *drawerTableView;

@end

@implementation DrawerViewController

- (void)viewDidLoad {  
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.drawerTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width - 135, self.view.frame.size.height - 100)];
    [self.drawerTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.drawerTableView.backgroundColor = [UIColor redColor];
    self.drawerTableView.alpha = 0.3;
    self.drawerTableView.delegate = self;
    self.drawerTableView.dataSource = self;
    [self.contentView addSubview:self.drawerTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *sidebarMenuCellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:sidebarMenuCellIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sidebarMenuCellIdentifier] ;
        cell.backgroundColor = [UIColor clearColor];
        
    }
    cell.selectionStyle = NO;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [NSString stringWithFormat:@"菜单%ld", (long)indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HomeTableViewController *controller = nil;
    id next = [self nextResponder];
    while(![next isKindOfClass:[HomeTableViewController class]])//这里跳不出来。。。
    {
        next = [next nextResponder];
    }
    if ([next isKindOfClass:[HomeTableViewController class]])
    {
        controller = (HomeTableViewController *)next;
    }
    
//    switch (indexPath.row) {
//        case 0:
//            controller.bgImageView.image = [UIImage imageNamed:@"img0"];
//            break;
//        case 1:
//            controller.bgImageView.image = [UIImage imageNamed:@"img1"];
//            break;
//        case 2:
//            controller.bgImageView.image = [UIImage imageNamed:@"img2"];
//            break;
//        default:
//            break;
//    }
    
    [self showHideSidebar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
