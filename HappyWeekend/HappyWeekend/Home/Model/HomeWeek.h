//
//  HomeWeek.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImageDownload.h"

@interface HomeWeek : NSObject<ImageDownloadDelegate>

@property(nonatomic , strong)NSString * book_endtime;//结束时间

@property(nonatomic , strong)NSString * title;//标题

@property(nonatomic , strong)NSString * status; //类型

@property(nonatomic , strong)NSString * address;//出发集合地址
@property(nonatomic , strong)NSString * distance;//距离

@property(nonatomic , assign)int follow_num;//关注度

@property(nonatomic , strong)NSString * cod;//编码

@property(nonatomic , assign)int buy_type;//购买类型

@property(nonatomic , strong)NSString * mainShows;//主题展示

@property(nonatomic , assign)int  price;//价钱

@property(nonatomic , strong)UIImage * img;//图片›



@property(nonatomic , strong)NSString * imgUrl;//图片网址

@property(nonatomic , assign)BOOL isDownloading;  //记录下载状



- (void)downloadImage;









@end
