//
//  DetailViewController.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "DetailViewController.h"
#import "URLHeaders.h"
#import "ScrollPhotoTableViewCell.h"
#import "MapTableViewCell.h"
#import "DetailTableViewCell.h"
#import "UITableViewCell+textHeight.h"
#import "PayTableViewController.h"
#define TopView 200
@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UIView * clearView;
@end

@implementation DetailViewController
- (void)initWithBar
{
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"touming"] forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setShadowImage:[UIImage alloc]];
    
        UIView * clearView = [[UIView alloc]init];
        clearView.frame = CGRectMake(0, 20, main_wight, 44);
        clearView.backgroundColor = [UIColor clearColor];
        [self.navigationController.navigationBar addSubview:clearView];
        self.clearView=clearView;
    
    
        UIBarButtonItem * shareItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"details_top_blue_share_inverse"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(shareBtnClick:)];
    
    UIBarButtonItem * collecItem =[[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"tab_fav_inverse_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(CollecBtnClick:)];
    self.navigationItem.rightBarButtonItems = @[shareItem,collecItem];
    
    [self.navigationController.navigationBar.layer setMasksToBounds:YES];//去掉navigationBar线
    
    
}

- (void)initWithBarBack
{
    
    [self initWithBar];
    
}


-(void)viewWillDisappear:(BOOL)animated

{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"touming"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage alloc]];
    
    UIView * clearView = [[UIView alloc]init];
    clearView.frame = CGRectMake(0, 20, main_wight, 44);
    clearView.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar addSubview:clearView];
    self.clearView=clearView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self foundTableView];
    [self foundUnderView];
   
   // [self creatChrysanthemum];

   // [self.chrysanthemum stopAnimating];
     }
/**
 *  视图即将出现
 *
 *  @param animated
 */
#warning 数据请求--------
-(void)viewWillAppear:(BOOL)animated
{
    //[super viewWillAppear:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWithBarBack];
     [self sendRequest];
   //self.navigationController.navigationBar.translucent = YES;
}


//网络请求数据处理
- (void)sendRequest
{
    NSString * urlStr = Detail_URL;
    NSURL * url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    
    __weak UITableView * table = self.detailTV;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue ] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if ( data) {
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            //创建新数组
          //  self.detailList = [NSMutableArray array];
         
            NSDictionary * oldDic = [dic objectForKey:@"result"] ;
            
            Detail * detail = [[Detail alloc] init];
                
            detail.floatStr = [oldDic objectForKey:@"title"];
            
            detail.content = [oldDic objectForKey:@"intro_show"];
            
            detail.addressesStr = [oldDic objectForKey:@"address"];
            
            detail.siteStr = [oldDic objectForKey:@"poi_name"];
                
            detail.price_h = [[oldDic objectForKey:@"price_show"] objectForKey:@"h"];
//            detail.price_h= [NSString stringWithFormat:@"免费"];
//            detail.price_l= [NSString stringWithFormat:@"免费"];

            detail.price_l = [[oldDic objectForKey:@"price_show"] objectForKey:@"l"];
         //   NSLog(@"```````%ld",(long)detail.price_l);
            
            detail.timeStr = [oldDic objectForKey:@"time_txt"];
            
            detail.tips_show = [oldDic objectForKey:@"tips_show"];
            
            detail.pic_details_photos = [oldDic objectForKey:@"pic_details_show"];
            
            self.deta = detail;

            
        }else{
        
        }
        
        [table reloadData];
    }];
}
/**
 *  创建tableView
 */
- (void)foundTableView
{
    UITableView * detaiTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, View_width, View_height-50) ];
    detaiTV.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    detaiTV.delegate = self;
    detaiTV.dataSource = self;
    detaiTV.tableFooterView = [[UIView alloc] init];
    detaiTV.bounces = YES;
    self.detailTV = detaiTV;
    [self.view addSubview:detaiTV];
   
//    detaiTV.contentInset = UIEdgeInsetsMake(TopView*0.5, 0, 0, 0);
//    _testView = [[UIImageView alloc] init];
//    _testView.image = [UIImage imageNamed:@"321"];
//    _testView.frame = CGRectMake(0, -TopView, main_wight, -TopView);
//    _testView.contentMode = UIViewContentModeScaleAspectFill;
//    [detaiTV insertSubview:_testView atIndex:0];
    
    
}

/**
 *  创建我要参加
 */
- (void)foundUnderView
{
    UIButton * joinButton = [UIButton buttonWithType:UIButtonTypeCustom];
    joinButton.frame = CGRectMake(30, View_height-45, View_width-60, 40);
    [joinButton setTitle:@"我要参加" forState:UIControlStateNormal];
    [joinButton addTarget:self action:@selector(joinView:) forControlEvents:UIControlEventTouchUpInside];
    joinButton.layer.cornerRadius = 15;
    joinButton.backgroundColor = [UIColor colorWithRed:0.957 green:0.271 blue:0.247 alpha:1.000];
    [self.view addSubview:joinButton];
}

// 创建菊花
- (void)creatChrysanthemum
{
    self.chrysanthemum = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.chrysanthemum.frame = CGRectMake(0, 0, 220, 120);
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 80, 220, 20)];
    label.font = [UIFont systemFontOfSize:12.0f];
    label.textColor = [UIColor lightGrayColor];
    label.text = @"我正在努力加载中......";
    label.textAlignment = NSTextAlignmentCenter;
    [self.chrysanthemum addSubview:label];
    self.chrysanthemum.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2 ,[UIScreen mainScreen].bounds.size.height/2 -100);
    self.chrysanthemum.color = [UIColor grayColor];
    self.chrysanthemum.hidesWhenStopped = YES;
    [self.chrysanthemum startAnimating];
    [self.view addSubview:self.chrysanthemum];
    
}
- (void)joinView:(UIButton *)sender
{
    

    PayTableViewController * payView = [[PayTableViewController alloc] init];
    payView.detail = self.deta;
    
    [UIView transitionWithView:self.navigationController.view duration:1 options:(UIViewAnimationOptionTransitionFlipFromRight) animations:^{
        [self.navigationController pushViewController: payView animated:NO];
    } completion:^(BOOL finished) {
        
    }];
//    [self.navigationController pushViewController:payView animated:YES];

}

- (void)shareBtnClick:(UIBarButtonItem *)sender
{
    NSLog(@"xxx");
}
- (void)CollecBtnClick:(UIBarButtonItem *)sender
{
    
}
- (void)blackBtnClick:(UIBarButtonItem *)sender
{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"white"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setShadowImage:[UIImage alloc]];
    [self.navigationController popViewControllerAnimated:YES];
}

/*
//不能下拉
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint aaa = scrollView.contentOffset;
    if (aaa.y > 50) {
        scrollView.contentOffset = CGPointMake(aaa.x, -20);
       
    }
//    CGFloat down = -(TopView * 0.5) - scrollView.contentOffset.y;
//    if (down < 0) {
//        return;
//    }
//    CGRect frame = _testView.frame;
//    frame.size.height = TopView + down;
//    _testView.frame = frame;
    
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return View_height /3+20;
    }else if(indexPath.row == 1){
       return 100;
    }else if(indexPath.row == 2){
        _deta.content = [_deta.content stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
        _deta.content = [_deta.content stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
        CGFloat height = [DetailTableViewCell getTextHeightForText:_deta.content fontSize:15.0 Width:main_wight-30];
        
        
        CGFloat tipsHeight = [DetailTableViewCell getTextHeightForText:_deta.tips_show fontSize:15.0 Width:main_wight-60];
        
        
        
        
        
        return height+ 180 +tipsHeight;
        
        
        
        
    }
    
    return 180;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  //  Detail * detailData = [self.detailList objectAtIndex:indexPath.row];
    
    if (indexPath.row == 0) {
        ScrollPhotoTableViewCell * scrollPhotocell = [tableView dequeueReusableCellWithIdentifier:@"secrollPhoto"];
        if (!scrollPhotocell) {
            scrollPhotocell = [[ScrollPhotoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"secrollPhoto"];
            scrollPhotocell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        scrollPhotocell.deta = self.deta;
       // [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        
        
        return scrollPhotocell;
        
    }else if(indexPath.row == 1){
        MapTableViewCell * mapCell = [tableView dequeueReusableCellWithIdentifier:@"map"];
        
        if (!mapCell) {
            mapCell = [[MapTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"map"];
            mapCell.selectionStyle = UITableViewCellSelectionStyleGray;
           
        }
        mapCell.detail = self.deta;
        // mapCell.detail = detailData;
        
        return mapCell;
    }else if(indexPath.row == 2){
        DetailTableViewCell * detailCell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"detail"];
        if (!detailCell) {
            detailCell = [[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"detail"];
            detailCell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
#warning 自适应方法-------
        [detailCell setCellWithDetail:self.deta];
        
        
        
        return detailCell;
    }

    
    return nil;

}
/**
 *  跳转页面
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
    // Dispose of any resources that can be recreated.
}



////区高
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 40;
//}
////区头
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UINavigationBar * bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
//    [bar setBackgroundImage:[UIImage imageNamed:@"touming"] forBarMetrics:UIBarMetricsDefault];
//
//
//    UINavigationItem * item = [[UINavigationItem alloc] initWithTitle:nil];
//
//    //设置分享按钮
//    UIButton * shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    shareBtn.frame = CGRectMake(0, 0, 30, 30);
//    [shareBtn setBackgroundImage:[UIImage imageNamed:@"details_top_blue_share_inverse"] forState:UIControlStateNormal];
//    [shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//
//    //设置收藏按钮
//    UIButton * collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    collectBtn.frame = CGRectMake(0, 0, 30, 30);
//    [collectBtn setBackgroundImage:[UIImage imageNamed:@"tab_fav_inverse_normal"] forState:UIControlStateNormal];
//    [collectBtn addTarget:self action:@selector(CollecBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//
//    //设置返回按钮
//    UIButton * blackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    blackBtn.frame = CGRectMake(0, 0, 30, 30);
//    [blackBtn setBackgroundImage:[UIImage imageNamed:@"tab_fav_inverse_normal"] forState:UIControlStateNormal];
//    [blackBtn addTarget:self action:@selector(blackBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//
//    //把按钮变为Item
//    UIBarButtonItem * shareItem = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
//    UIBarButtonItem * collectItem = [[UIBarButtonItem alloc] initWithCustomView:collectBtn];
//    UIBarButtonItem * blackItem = [[UIBarButtonItem alloc] initWithCustomView:blackBtn];
//    NSArray * arrryBtn = @[collectItem,shareItem];
//
//    [item setRightBarButtonItems:arrryBtn];
//    [item setLeftBarButtonItem:blackItem];
//
//    [bar pushNavigationItem:item animated:NO];
//    return bar;
//}
@end
