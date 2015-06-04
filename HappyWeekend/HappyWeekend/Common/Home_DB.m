//
//  Home_DB.m
//  HappyWeekend
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "Home_DB.h"
#import "HomeListTwo.h"
#import "FMDB.h"
@implementation Home_DB
static FMDatabase * _db;
+ (void)initialize
{
    //打开数据库
    
    NSString * path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Home.sqlite"];
    NSLog(@"%@",path);
    _db = [FMDatabase databaseWithPath:path];
    [_db open];
    
    //创建表格
    
    
    [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_home (id integer , title text PRIMARY KEY,item text)"];

    
}

+ (NSMutableArray *)homes
{
    FMResultSet * set=[_db executeQuery:@"SELECT * FROM t_home;"];
    NSMutableArray * homes = [NSMutableArray array];
    //不断的往下取数据
    while (set.next) {
        //获得当前所指向的数据
        HomeListTwo * home  = [[HomeListTwo alloc]init];
        
        home.title  =  [set stringForColumn:@"title"];
        home.item_type  = [set stringForColumn:@"item"];
        
        [homes  addObject:home];
    }
    return homes;

}

//添加一个类型
+ (void)addHome:(HomeListTwo *)home
{
    [_db executeUpdateWithFormat:@"INSERT INTO t_home (title,item)  VALUES (%@,%@);",home.title,home.item_type];
}
//删除数据
+ (void)deleteHome:(HomeListTwo *)home
{
    [_db executeUpdateWithFormat:@"DELETE FROM t_home WHERE title = %@",home.title];
}

//搜索
+ (HomeListTwo *)search:(NSString *)searchText
{
    FMResultSet * set=[_db executeQuery:@"SELECT * FROM t_home WHERE title LIKE '%%%@%%';",searchText];
            HomeListTwo * home  = [[HomeListTwo alloc]init];
    //不断的往下取数据
    while (set.next) {
        //获得当前所指向的数据

        
        home.title  =  [set stringForColumn:@"title"];
        home.item_type  = [set stringForColumn:@"item"];
        
    }
    return home;
}
@end
