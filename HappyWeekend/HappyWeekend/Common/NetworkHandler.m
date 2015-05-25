//
//  NetworkHandler.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NetworkHandler.h"

@implementation NetworkHandler



-(void)getHomeListWithURL:(NSURL *)url competion:(CallBack)callBack
{
    //将传过来的callBack保存在属性中
    self.callBack = callBack;
    
//    __block NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       
        NSMutableArray * homArray = [[NSMutableArray alloc]init];
        //解析
        if (data == nil) {
            return ;
            
        }
        
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *temDic=[dic objectForKey:@"result"];
        NSArray * listArray = [temDic objectForKey:@"list"];
        
        for (NSDictionary * homeDic in listArray) {
            HomeWeek * home = [[HomeWeek alloc]init];
      //      [home setValuesForKeysWithDictionary:homeDic];
            
            NSString * title = [homeDic objectForKey:@"title"];
            home.title = title;
            
            NSLog(@"%@", home.title);
            
            NSString * dis = [homeDic objectForKey:@"distance_show"];
            home.distance = dis;
            
      //      NSLog(@"%@",dis);
           
            NSDictionary * addr = [homeDic objectForKey:@"poi"];
            home.address = [addr objectForKey:@"title"];
       //     NSLog(@"%@",home.address);
            
            NSDictionary * price = [homeDic objectForKey:@"price_show"];
            home.price = [[price objectForKey: @"h"] floatValue];
            
            home.imgUrl = [homeDic objectForKey:@"pic_list_img"];
           
            NSLog(@"%@",home.imgUrl);
            
            
            [homArray addObject:home];
           NSLog(@"%@",homArray[0]);
        }
        NSLog(@"000000000%@",homArray);
        //回调。。。
        self.callBack(homArray);
  
        
    }];
    
   
  
}
@end
