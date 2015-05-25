//
//  ImageDownload.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ImageDownload.h"

@implementation ImageDownload

-(id)initWithUrlString:(NSString *)urlStr
{
    self =  [super init];
    if (self) {
        _urlStr = urlStr;
    }
    return self;
}

//开始下载
-(void)startDownload
{
    //1、准备url
    NSString * urlStr = _urlStr;
    NSURL * url = [NSURL URLWithString:urlStr];
    
    //2、创建请求对象
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    
    //3、创建连接，发送请求
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        UIImage * img = [[UIImage alloc]initWithData:data];
        //如果代理不为空，并且响应 ImageDownloadDidFinishLoading方法
        if (_delegate != nil && [_delegate respondsToSelector:@selector(imageDownloadDidFinishLoading:)]) {
            [_delegate imageDownloadDidFinishLoading:img];
        }
    
        
    }];
  
}

-(id)initWithUrlString:(NSString *)urlStr delegate:(id<ImageDownloadDelegate>)delegate
{
    self = [self initWithUrlString:urlStr];
    if (self) {
        _delegate = delegate;
    }
    return self;
    
}

+(ImageDownload *)imageDownloadWithUrlStr:(NSString *)urlStr delegate:(id<ImageDownloadDelegate>)delegate
{
    ImageDownload * download = [[ImageDownload alloc]initWithUrlString:urlStr delegate:delegate];
    
    [download startDownload];
    return download ;

}


@end
