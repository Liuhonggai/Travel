//
//  Cachemanger.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "Cachemanger.h"

@implementation Cachemanger


//获取cache路径
+(NSString *)cachePath
{
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory , NSUserDomainMask, YES)lastObject];
    
    return path;
}

//获取cache路径下downloadImage文件夹
+(NSString * )downloadImageFileInChche
{
    NSString * cachePath = [self cachePath];
    
    NSString * imgCacheFile = [cachePath stringByAppendingPathComponent:@"DownloadImage"];
    NSFileManager * manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:imgCacheFile]) {
        [manager createDirectoryAtPath:imgCacheFile withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return imgCacheFile;
    
    
    
}


//清除缓存
+(void)clearCache
{
    NSString * imgCacheFile = [self downloadImageFileInChche];
    
    NSFileManager * manager = [NSFileManager defaultManager];
    
    [manager removeItemAtPath:imgCacheFile error:nil];
}

//判断文件是否存在
+(BOOL)fileExistInImageCacheFile:(NSString *)fileName
{
    //将文件名中的‘/’替换成‘_’
    NSString * legalFileName = [fileName stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    //获取DownloadImage缓存文件
    NSString * cachePath = [self downloadImageFileInChche];
    //拼接成完整路径
    NSString * realPath = [cachePath stringByAppendingPathComponent:legalFileName];
    //判断文件是否存在并返回
    NSFileManager * manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:realPath]) {
        return YES;
    }else
    {
        return NO;
    
    }
}

//传入一个url地址，返回在DownloadImage文件夹下的路径
+(NSString *)pathForCache:(NSString *)urlStr
{
    NSString * legalName = [urlStr stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    
    NSString * downloadImageFilePath = [self downloadImageFileInChche];
    
    NSString * fullPath = [downloadImageFilePath stringByAppendingPathComponent:legalName];
    
    return fullPath;

}

@end
