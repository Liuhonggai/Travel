//
//  NetworkHandler.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeList.h"
#import "HomeListTwo.h"



typedef void(^CallBack)(id);


@interface NetworkHandler : NSObject

@property(nonatomic,copy) CallBack callBack;

//@property(nonatomic , assign)void(*func)(id);

//请求活动列表
-(void)getHomeListWithURL:(NSURL *)url competion:(CallBack)callBack;






@end
