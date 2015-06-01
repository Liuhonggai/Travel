//
//  Detail.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageDownload.h"
@interface Detail : NSObject
@property (nonatomic, strong)NSString * siteStr;
@property (nonatomic, strong)NSString * addressesStr;
@property (nonatomic, strong)NSString * floatStr;
@property (nonatomic, strong)NSString*  price_h;
@property (nonatomic, strong)NSString* price_l;
@property (nonatomic, strong)NSString * timeStr;
@property (nonatomic, strong)NSString * content;

@property (nonatomic, strong)NSString * tips_show;
@property (nonatomic, strong)NSMutableArray * pic_details_photos;


@property (nonatomic, strong)UIImage * img;
@property (nonatomic, assign)BOOL isDownloading;




@end
