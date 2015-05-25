//
//  ImageDownload.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class ImageDownload;

@protocol ImageDownloadDelegate <NSObject>

- (void)imageDownloadDidFinishLoading:(UIImage *)img;

@end


@interface ImageDownload : NSObject


@property(nonatomic , weak)NSString * urlStr;

@property(nonatomic , assign)id<ImageDownloadDelegate>delegate;

-(id)initWithUrlString:(NSString *)urlStr;
-(id)initWithUrlString:(NSString *)urlStr delegate:(id<ImageDownloadDelegate>)delegate;


+(ImageDownload *)imageDownloadWithUrlStr:(NSString *)urlStr delegate:(id<ImageDownloadDelegate>)delegate;


//开始下载
-(void)startDownload;


@end
