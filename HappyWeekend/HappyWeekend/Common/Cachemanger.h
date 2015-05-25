//
//  Cachemanger.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cachemanger : NSObject


//获取cache路径
+(NSString *)cachePath;

//获取cache路径下downloadImage文件夹
+(NSString * )downloadImageFileInChche;


//清除缓存
+(void)clearCache;

//判断文件是否存在
+(BOOL)fileExistInImageCacheFile:(NSString *)fileName;

//传入一个url地址，返回在DownloadImage文件夹下的路径
+(NSString *)pathForCache:(NSString *)urlStr;









@end
