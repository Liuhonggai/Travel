//
//  HomeTableViewController.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HomeTableViewController.h"
#import "DrawerViewController.h"
@interface HomeTableViewController ()
@property (nonatomic ,strong) DrawerViewController *drawerVC;
@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //左边侧栏开始
    // 左侧边栏开始
//    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
//    [panGesture delaysTouchesBegan];
//    [self.view addGestureRecognizer:panGesture];
        
    [self initNavigationBar];

    self.drawerVC = [[DrawerViewController alloc] init];
    [self.drawerVC setBgRGB:0x000000];
    [self.view addSubview:self.drawerVC.view];
    self.drawerVC.view.frame  = self.view.bounds;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    
}
- (void)initNavigationBar
{
    [self.navigationController setNavigationBarHidden:YES];
    UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    [bar setBackgroundColor:[UIColor whiteColor]];
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:nil];
    
    UIButton *left = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [left setFrame:CGRectMake(0, 2, 28, 28)];
    [left setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
//    [left setBackgroundColor:[UIColor redColor]];
    [left addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:left];
    [item setLeftBarButtonItem:leftButton];
    [bar pushNavigationItem:item animated:NO];
    
    [self.view addSubview:bar];
}

- (void)click
{
    [self.drawerVC showHideSidebar];
}

- (void)panDetected:(UIPanGestureRecognizer*)recoginzer
{
    [self.drawerVC panDetected:recoginzer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    cell.selectionStyle = NO;
    
    // Configure the cell...
    
    return cell;
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
