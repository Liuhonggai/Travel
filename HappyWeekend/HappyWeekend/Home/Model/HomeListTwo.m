//
//  HomeListTwo.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HomeListTwo.h"

@implementation HomeListTwo

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqual:@"id"]) {
        self.lyID=[value intValue];
    }
}

@end
