//
//  UITableViewCell+textHeight.m
//  Lesson11_UI
//
//  Created by lanou3g on 15-3-6.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "UITableViewCell+textHeight.h"

@implementation UITableViewCell (textHeight)
+ (CGFloat)getTextHeightForText:(NSString *)text fontSize:(CGFloat)fontSize Width:(CGFloat)width
{
    CGSize size = CGSizeMake(width, 100000);
    NSDictionary * dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect.size.height;
}
@end
