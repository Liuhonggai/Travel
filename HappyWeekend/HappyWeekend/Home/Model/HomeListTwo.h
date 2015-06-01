//
//  HomeListTwo.h
//  HappyWeekend
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeListTwo : NSObject

@property(nonatomic,assign)int lyID;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *pic_list_img;
@property(nonatomic,strong)NSDictionary *poi;
@property(nonatomic,strong)NSString *distance_show;
@property(nonatomic,strong)NSString *genre_main_show;//类型
@property(nonatomic,strong)NSString *genre_main_pic_show;
@property(nonatomic,strong)NSString *item_type;
@property(nonatomic,strong)NSDictionary * price_show;

@end
