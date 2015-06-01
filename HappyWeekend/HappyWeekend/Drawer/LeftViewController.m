//
//  LeftViewController.m
//  ZMYDrawerViewController
//
//  Created by 张茫原 on 15/5/23.
//  Copyright (c) 2015年 芒果. All rights reserved.
//

#import "LeftViewController.h"
#import "SettingTableViewController.h"
#import "HomeTableViewController.h"
@interface LeftViewController ()

@property (nonatomic ,strong) NSArray *arr;
@property (nonatomic,assign) BOOL isClick;
@property (nonatomic ,strong) NSArray *photoArr;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *table = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = [UIColor whiteColor];
    table.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:table];
    
    self.arr = [NSArray arrayWithObjects:@"",@"登录",@"我的收藏",@"设置", nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 150;
    }
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 1) {
        cell.imageView.image =  [UIImage imageNamed:@"20150530024202197_easyicon_net_32"];
        cell.textLabel.text = [self.arr objectAtIndex:1];
    }else if(indexPath.row == 2)
    {
        cell.imageView.image = [UIImage imageNamed:@"20150530024317286_easyicon_net_32"];
        cell.textLabel.text = [self.arr objectAtIndex:2];
        
    }else if(indexPath.row == 3){
        cell.imageView.image = [UIImage imageNamed:@"20150530024438931_easyicon_net_32"];
        cell.textLabel.text = [self.arr objectAtIndex:3];
        
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 3) {
        //设置
        SettingTableViewController *setting = [[SettingTableViewController alloc] init];
        [self presentViewController:setting animated:YES completion:nil];
    }else if(indexPath.row == 2)
    {
        //收藏
        
    }else if(indexPath.row == 1)
    {
        
    }
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
