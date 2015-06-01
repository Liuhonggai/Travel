//
//  HomeViewCell.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HomeViewCell.h"
#import "UIImageView+WebCache.h"

@implementation HomeViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height/3-30)];
        self.imgView = imgV;
        [self addSubview:imgV];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/3-30, [[UIScreen mainScreen] bounds].size.width, 15)];
        titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel = titleLabel;
        [self addSubview:titleLabel];
        
        UILabel * addrLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height/3-15, [[UIScreen mainScreen]bounds].size.width, 15)];
        addrLabel.font = [UIFont systemFontOfSize:12];
        self.addrLabel = addrLabel;
        [self addSubview:addrLabel];
        
        UILabel * disLabel = [[UILabel alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-80, [[UIScreen mainScreen] bounds].size.height/3-15, [[UIScreen mainScreen]bounds].size.width, 15)];
        addrLabel.font = [UIFont systemFontOfSize:12];
        self.disLabel = disLabel;
        [self addSubview:disLabel];
        
        UILabel * pLabel = [[UILabel alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-80, [[UIScreen mainScreen] bounds].size.height/3-65, 100, 20)];
        pLabel.backgroundColor = [UIColor blackColor];
        pLabel.textColor = [UIColor whiteColor];
        addrLabel.font = [UIFont systemFontOfSize:13];
        self.pLabel = pLabel;
        [self addSubview:pLabel];
        
        
    }
    return  self;
    
}

-(void)click:(UIButton * )btn
{
    btn.showsTouchWhenHighlighted = YES;
    
}
-(void)setHomeListTwo:(HomeListTwo *)homeListTwo
{
    if (_homeListTwo != homeListTwo) {
        _homeListTwo = homeListTwo;
    }
       NSURL *url = [NSURL URLWithString:homeListTwo.pic_list_img];
    [self.imgView sd_setImageWithURL:url];
    self.titleLabel.text = homeListTwo.title;
    self.disLabel.text = homeListTwo.distance_show;
    //ID数据的解析
       // self.IDLabel.text = homeListTwo.lyID;
        NSLog(@"!!!!!!!!%d",homeListTwo.lyID);
    //字典里取地址
    NSString * str =[homeListTwo.poi objectForKey:@"title"];
    self.addrLabel.text  = str;
    
    //价钱需要判断，如果为0则显示免费
    NSString * l = [NSString stringWithFormat:@"%@",[homeListTwo.price_show objectForKey:@"l"]];
    if ([l isEqualToString:@"0"]) {
        self.pLabel.text = @"免费";
    }else{
        self.pLabel.text = [NSString stringWithFormat:@"%@--%@ 元",[homeListTwo.price_show objectForKey:@"l"],[homeListTwo.price_show objectForKey:@"h"]];
    }
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


















//set方法，赋值
//-(void)setHomeWeek:(HomeWeek *)homeWeek
//{
//    if (_homeWeek!=homeWeek) {
//        _homeWeek = homeWeek;
//    }
//    if (homeWeek.list.count == 0) {
//        self.titleLabel.text = homeWeek.title;
//        self.disLabel.text = homeWeek.distance_show;
//        self.pLabel.text = [NSString stringWithFormat:@"%.1f - %.1f 元",homeWeek.priceL,homeWeek.priceH];
//        self.addrLabel.text = [NSString stringWithFormat:@"%@",homeWeek.poi];
//    }else
//    {
//
//    }
//
//
//
//
//
//
//
//
//    /**
//     *
//     *
//     */
////    if (!homeWeek.img && homeWeek.isDownloading == NO) {//如果图片为空并且没有正在下载，则下载
////
////        //在图片下载期间，显示图片1_wsk_123_123
////        self.imgView.image = [UIImage imageNamed:@"1_wsk_123_123"];
////        [homeWeek downloadImage];
////
////        //homeweek添加观察者
////        [homeWeek.img addObserver:self forKeyPath:@"img" options:NSKeyValueObservingOptionNew context:nil];
////    }else{
////        self.imgView.image = homeWeek.img;
////    }
//
//
//#pragma------------sdwebImage--------------------------
//    /**
//     *  sdwebImage
//     *
//     *  加载图片方法
//     *
//     *  @return <#return value description#>
//     */
//    [self.imgView sd_setImageWithURL:[NSURL URLWithString:homeWeek.imgUrl] placeholderImage:[UIImage imageNamed:@"1"]];
//
//
//
//
//}
//-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//
//    //获取图片
//    UIImage * img = change[NSKeyValueChangeNewKey];
//    if ([img isEqual:[NSNull null]]) {
//
//        return;
//    }
//    UITableView * tableView = (UITableView *)self.superview.superview;
//    if ([tableView isKindOfClass:[UITableView class]]) {
//        [tableView reloadData];
//    }
//    [self.homeWeek removeObserver:self forKeyPath:keyPath];
//
//}










@end
