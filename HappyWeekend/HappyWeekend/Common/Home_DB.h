//
//  Home_DB.h
//  HappyWeekend
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HomeListTwo;

@interface Home_DB : NSObject

+ (NSMutableArray *)homes;
//添加类
+ (void)addHome:(HomeListTwo *)home;
//删除
+ (void)deleteHome:(HomeListTwo *)home;
//搜索
+ (HomeListTwo *)search:(NSString *)searchText;
@end
