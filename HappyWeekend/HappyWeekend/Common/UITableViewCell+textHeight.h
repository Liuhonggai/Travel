//
//  UITableViewCell+textHeight.h
//  Lesson11_UI
//
//  Created by lanou3g on 15-3-6.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (textHeight)
+ (CGFloat)getTextHeightForText:(NSString *)text fontSize:(CGFloat)fontSize Width:(CGFloat)width;
@end
