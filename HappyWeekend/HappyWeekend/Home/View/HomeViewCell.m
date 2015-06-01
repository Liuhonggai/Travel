//
//  HomeViewCell.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HomeViewCell.h"
#import "HomeWeek.h"
#import "UIImageView+WebCache.h"
@implementation HomeViewCell

- (void)imageDownloadDidFinishLoading:(UIImage *)img
{
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //布局子视图
        /**
         *  你用的哪个imageView?
         */
//        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width,[UIScreen mainScreen].bounds.size.height*1/3-50)];
        
        /**
         *
         * 替换成你self.imgView
         */
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width,[UIScreen mainScreen].bounds.size.height*1/3-50)];
        _imgView.image = [UIImage imageNamed:@"2.png"];
        [self.contentView addSubview:_imgView];
        
        UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height*1/3-50, self.frame.size.width, 25)];
       self.titleLabel=titleLabel;
        titleLabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:titleLabel];
       
        
        UILabel * addrLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height*1/3-25, self.frame.size.width, 25)];
        addrLabel.text = @"砂之国";
        self.addrLabel = addrLabel;
        addrLabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:addrLabel];
        
        UILabel * disLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-70, [UIScreen mainScreen].bounds.size.height*1/3-25, self.frame.size.width-220, 25)];
        disLabel.text = @"70KM";
        self.disLabel = disLabel;
        disLabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:disLabel];
        
        UILabel * priceLabel  = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-60, [UIScreen mainScreen].bounds.size.height*1/3-85, 40, 40)];
        priceLabel.text = @"70元";
        self.pLabel = priceLabel;
        priceLabel.font = [UIFont systemFontOfSize:18];

        [_imgView addSubview:priceLabel];
        
        //添加点击按钮
 
       
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-60,[UIScreen mainScreen].bounds.size.height*1/3-170, 30, 30)];
        btn.backgroundColor = [UIColor redColor];
        //设置btn的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
        //添加点击事件
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown ];
        btn.layer.cornerRadius = 15;
        btn.layer.masksToBounds = YES;
        [self.contentView addSubview:btn];
        
        
    }
    return  self;
    
}

-(void)click:(UIButton * )btn
{
    btn.showsTouchWhenHighlighted = YES;

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

-(void)setHomeWeek:(HomeWeek *)homeWeek
{
     _homeWeek=homeWeek;
    self.titleLabel.text = homeWeek.title;
    self.disLabel.text = homeWeek.distance;
    self.addrLabel.text = homeWeek.address;
    self.pLabel.text = [NSString stringWithFormat:@"%d",homeWeek.price];
    self.homeId = homeWeek.homeId;
    NSLog(@"!!!!!!!!!!!!%@",self.homeId);
    /**
     *
     *  ok 应经改好了  你可以放开注释看看
     */
    if (!homeWeek.img && homeWeek.isDownloading == NO) {//如果图片为空并且没有正在下载，则下载
        
        //在图片下载期间，显示图片1_wsk_123_123
        self.imgView.image = [UIImage imageNamed:@"1_wsk_123_123"];
        [homeWeek downloadImage];
        
        //homeweek添加观察者
        [homeWeek.img addObserver:self forKeyPath:@"img" options:NSKeyValueObservingOptionNew context:nil];
    }else{
        self.imgView.image = homeWeek.img;
    }
    
    
#pragma------------sdwebImage--------------------------
    /**
     *  sdwebImage
     *
     *  加载图片方法
     *
     *  @return <#return value description#>
     */
   [self.imgView sd_setImageWithURL:[NSURL URLWithString:homeWeek.imgUrl] placeholderImage:[UIImage imageNamed:@"1_wsk_123_123"]];
    

}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    //获取图片
    UIImage * img = change[NSKeyValueChangeNewKey];
    if ([img isEqual:[NSNull null]]) {
        
        return;
    }
    UITableView * tableView = (UITableView *)self.superview.superview;
    if ([tableView isKindOfClass:[UITableView class]]) {
        [tableView reloadData];
    }
    [self.homeWeek removeObserver:self forKeyPath:keyPath];

}


-(void)download:(ImageDownload *)download didFinishLoading:(UIImage *)img
{
    self.imgView.image = img;
}
@end
