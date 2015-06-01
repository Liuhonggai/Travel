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
    NSMutableArray *homeArray = [NSMutableArray array];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (!data) {
            return;
        }
        NSDictionary *firstDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *secondDic = [firstDic objectForKey:@"result"];
        NSArray *firstArr = [secondDic objectForKey:@"list"];
        for (NSDictionary *dic in firstArr) {
            if (dic.count==4) {
                HomeList *homeList = [[HomeList alloc] init];
                [homeList setValuesForKeysWithDictionary:dic];
                [homeArray addObject:homeList];
                
            }else{
                HomeListTwo *homeListTwo = [[HomeListTwo alloc] init];
                [homeListTwo setValuesForKeysWithDictionary:dic];
                NSLog(@"%d",homeListTwo.lyID );
                [homeArray addObject:homeListTwo ];
                
                
                
                
            }
        }
        //回调。。。
        self.callBack(homeArray);
        
    }];
    
    
    
}





@end
