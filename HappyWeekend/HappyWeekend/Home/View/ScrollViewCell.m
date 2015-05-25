//
//  ScrollViewCell.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/20.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ScrollViewCell.h"
#import "UIImageView+WebCache.h"
@implementation ScrollViewCell

- (void)imageDownloadDidFinishLoading:(UIImage *)img
{
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
        UIScrollView * tempView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width,[UIScreen mainScreen].bounds.size.height*1/3)];
         self.scrollView = tempView;
       
        UIPageControl * tempPage = [[UIPageControl alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height*1/3-30, self.contentView.frame.size.width, 30)];
        [tempPage setBackgroundColor:[UIColor clearColor]];
        [tempPage setAlpha:1];
        self.pageControl = tempPage;
        
        
         _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width,[UIScreen mainScreen].bounds.size.height*1/3)];
        
        self.imageArray = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"1"],[UIImage imageNamed:@"10"],[UIImage imageNamed:@"2"],[UIImage imageNamed:@"5"], nil];
       
        
        
        [self.contentView addSubview:tempView];
        [self.contentView addSubview:tempPage];
        
        //添加价钱的label
        
        UILabel * pLabel  = [[UILabel alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width-60, [UIScreen mainScreen].bounds.size.height*1/3-50, 40, 40)];
        pLabel.text = @"70元";
        pLabel.textColor = [UIColor redColor];
        pLabel.font = [UIFont systemFontOfSize:18];
       
        [self.contentView addSubview:pLabel];
  
        //添加点击按钮
    
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width-60, [UIScreen mainScreen].bounds.size.height*1/3-150, 30, 30)];
        btn.backgroundColor = [UIColor redColor];
        //设置btn的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
        //添加点击事件
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown ];
        btn.layer.cornerRadius = 15;
        btn.layer.masksToBounds = YES;
        [self.contentView addSubview:btn];
        
        
    self.contentView.backgroundColor = [UIColor whiteColor];
   
       [self createsCrollView:nil];
    }
    return self;
}

//btn的点击事件
-(void)click:(UIButton * )btn
{
   btn.showsTouchWhenHighlighted = YES;
}

//创建滚动视图区域

- (void)createsCrollView:(id)sender

{
    
    //设置委托
    
    self.scrollView.delegate = self;
    
    //将是否取消对内容视图触摸的反应设为NO
    
    self.scrollView.canCancelContentTouches = NO;
    
    //设置滚动条类型
    
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    
    //是否可以缩放
    
    self.scrollView.scrollEnabled = YES;
    
    //是否可以进行页面切换
    
    self.scrollView.pagingEnabled = YES;
    
    NSUInteger page = 0;//为了记录页数
    
    int originX = 0;
    
    //填充滑动视图内容
    
    for (UIImage * image in self.imageArray) {
        
        //首先创建一个视图
        
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectZero];
        
        //为这个图片设置适当位置
        
        CGRect rect ;
        
        rect.origin.x = originX;
        
        rect.origin.y = 0;
        
        rect.size.width = self.scrollView.frame.size.width;
        
        rect.size.height = self.scrollView.frame.size.height;
        
        imageview.frame = rect;
        
        //设置图片为背景
        
        imageview.image = image;
        
        
        
        //传值
        
      //  _imgView.image = image;
        //添加到视图中
        
        [self.scrollView addSubview:imageview];
        
       
        
        //确定下张图片开始的x坐标
        
        originX += self.scrollView.frame.size.width;
        
        //记录页数
        
        page++;
        
    }
    
    //设置总页数
    
    self.pageControl.numberOfPages = page;
    
    //设置默认页为首页
    
    self.pageControl.currentPage = 0;
    
    self.pageControl.tag = 100;
    
    //为页数控制关联方法
    
    [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    //显示适当区域
    
    [self.scrollView setContentSize:CGSizeMake(originX, self.scrollView.frame.size.height)];
    
}


//点击小点切换页面

- (void)changePage:(id)sender

{
    
    //创建一个区域
    
    CGRect rect;
    
    rect.origin.x = self.pageControl.currentPage * self.scrollView.frame.size.width;
    
    rect.origin.y = 0;
    
    rect.size.width = self.scrollView.frame.size.width;
    
    rect.size.height = self.scrollView.frame.size.height;
    
    //设置滚动视图的可视区域
    
    [self.scrollView scrollRectToVisible:rect animated:YES];
    
}



//重写滑动结束后的反应，就是把pageConteol的当前页跟随滑动而动

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView

{
    
    //取滚动视图区域的宽
    
    float orginX = self.scrollView.frame.size.width;
    
    //利用当前视图显示区域到view.frame的偏移量，来换算获取当前处在第几页
    
    int page = ((self.scrollView.contentOffset.x - orginX))/orginX +1;
    
    //当前页改为这一页。
    
    self.pageControl.currentPage = page;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//set方法，赋值

-(void)setHomeWeek:(HomeWeek *)homeWeek
{
    self.titleLabel.text = homeWeek.title;
    self.disLabel.text = homeWeek.distance;
    self.addrLabel.text = homeWeek.address;
    self.pLabel.text = [NSString stringWithFormat:@"%d",homeWeek.price];
    
        if (!homeWeek.img && homeWeek.isDownloading == NO) {//如果图片为空并且没有正在下载，则下载
    
    
            //在图片下载期间，显示图片1_wsk_123_123
            self.imgView.image = [UIImage imageNamed:@"1_wsk_123_123"];
            [homeWeek downloadImage];
    
            //homeweek添加观察者
            [homeWeek addObserver:self forKeyPath:@"img" options:NSKeyValueObservingOptionNew context:nil];
        }else{
            self.imgView.image = homeWeek.img;
        }
    
    
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
