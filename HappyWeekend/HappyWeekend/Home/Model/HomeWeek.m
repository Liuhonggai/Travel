//
//  HomeWeek.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HomeWeek.h"
#import "Cachemanger.h"

@implementation HomeWeek

//下载图片
- (void)downloadImage
{
    if (!_imgUrl) {
        //如果图片是空，直接返回
        return ;
    }
    self.isDownloading = YES ;
    [ImageDownload imageDownloadWithUrlStr:_imgUrl delegate:self];
    
   
}
- (void)imageDownloadDidFinishLoading:(UIImage *)img
{
    //将图片持久化
    _isDownloading = NO;
    self.img = img;
    
   //1、判断图片已经缓存
    NSString * path = [Cachemanger pathForCache:_imgUrl];
    
    //归档
    
    NSMutableData * data = [NSMutableData data];
    NSKeyedArchiver * archive = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archive encodeObject:_img forKey:@"img"];
    [archive finishEncoding];
    

    //写入文件
    [data writeToFile:path atomically:YES];
    
}

- (UIImage *)img
{
    if (!_img) {
        
        NSString * path = [Cachemanger pathForCache:_imgUrl];
        NSFileManager * manager = [NSFileManager defaultManager];
        if ([manager fileExistsAtPath:path]) {
            
            NSData * data = [NSData dataWithContentsOfFile:path];
            NSKeyedUnarchiver * unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
            
            _img = [unArchiver decodeObjectForKey:@"img"];
        }
        
    }
    
    
    return _img ;
}







@end
