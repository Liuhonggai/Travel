//
//  ScrollViewCell.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ScrollViewCell.h"
#import "UIImageView+WebCache.h"
#import "HomeListTwo.h"
@implementation ScrollViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height/3)];
        scrollView.backgroundColor = [UIColor yellowColor];
        self.scrollView = scrollView;
        [self addSubview:scrollView];
        
    }
    return self;
}
-(void)setHomeList:(HomeList *)homeList
{
    if (_homeList != homeList) {
        _homeList = homeList;
    }
    NSArray *list = homeList.list;
    for (int i = 0; i < list.count; i++) {
        NSDictionary *dic = [list objectAtIndex:i];
        NSURL *url = [dic objectForKey:@"pic_list_show"];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i*[[UIScreen mainScreen] bounds].size.width, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height/3)];
        [imgView sd_setImageWithURL:url];
        [self.scrollView addSubview:imgView];
        self.scrollView.contentSize = CGSizeMake((i+1)*[[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height/3);
        self.scrollView.pagingEnabled = YES;
    }
}







@end
