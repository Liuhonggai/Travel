//
//  ScrollPhotoTableViewCell.m
//  UINAV
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ScrollPhotoTableViewCell.h"
#import "URLHeaders.h"
#import "UIImageView+WebCache.h"
@interface ScrollPhotoTableViewCell()<UIScrollViewDelegate>

@end


@implementation ScrollPhotoTableViewCell
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (void)setDeta:(Detail *)deta
{
    if (_deta != deta) {
        _deta = deta;
    }
    
    self.floatLabel.text = deta.floatStr;
  //  NSLog(@"%d",[[NSString stringWithFormat:@"%d",_deta.price_h] isEqualToString:@"0"] && [[NSString stringWithFormat:@"%d",_deta.price_l] isEqualToString:@"0"]);
   
    if (([[NSString stringWithFormat:@"%@",_deta.price_h] isEqualToString:@"0"] && [[NSString stringWithFormat:@"%@",_deta.price_l] isEqualToString:@"0"])) {
        self.priceLabel.text = @"免费";

        
    }else {
        
        self.priceLabel.text = [NSString stringWithFormat:@"%@-%@元",_deta.price_l,_deta.price_h];
        

    }
   // self.priceLabel.text = [NSString stringWithFormat:@"%d-%d元",_deta.price_l,_deta.price_h];
   
   
    self.imageArry = deta.pic_details_photos;
    [self foundScrollView];
    
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.contentView.backgroundColor = [UIColor cyanColor];
        
        
        
        //label
        _floatLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,135, main_wight-20, 30)];
        _floatLabel.font = [UIFont systemFontOfSize:18];
        _floatLabel.textColor = [UIColor whiteColor];
        [self addSubview:_floatLabel];
    
        //价格label
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(main_wight-150, 150, 150, 80)];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.font = [UIFont systemFontOfSize:22];
        _priceLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:_priceLabel];
        
        //点击按钮打开隐藏界面
//        _clickBtn = [[UIButton alloc] initWithFrame:CGRectMake(main_wight - 35, 180, 30, 20)];
//        _clickBtn.tag = 1;
//        [_clickBtn setTitle:@"点击" forState:UIControlStateHighlighted];
//        [_clickBtn addTarget:self action:@selector(clickBtnPop:) forControlEvents:UIControlEventTouchUpInside];
//        [self.contentView addSubview:_clickBtn];
    }
    return self;
}



/**
 *  创建scrollView
 */
- (void)foundScrollView
{
    _photoScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,-64, main_wight,235)];
    _photoScrollView.delegate = self;
    _photoScrollView.pagingEnabled = YES;
    _photoScrollView.showsHorizontalScrollIndicator = NO;
    
    UIPageControl * pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(main_wight-100, 120, 80, 30)];
    
    [pageControl addTarget:self action:@selector(pickChange:) forControlEvents:UIControlEventValueChanged];
    self.pageControl = pageControl;
    
    for (int i = 0 ; i < _imageArry.count; i ++) {
        _scrollView_image = [[UIImageView alloc] initWithFrame:CGRectMake(i * main_wight, 0, main_wight, 235)];
        NSString * str = [_imageArry objectAtIndex:i];
    
        NSURL * url = [NSURL URLWithString:str];
        
        [_scrollView_image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pic_default"]];
        
        pageControl.numberOfPages = i+1;
        
        _photoScrollView.contentSize = CGSizeMake((i+1) * main_wight,235);
        
        [_photoScrollView addSubview:_scrollView_image];
    }
    [self.contentView addSubview:_photoScrollView];
    [self.contentView addSubview:pageControl];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    int pageCont = offset.x/self.frame.size.width;
    //当前页数
    self.pageControl.currentPage = pageCont;
    
}

- (void)pickChange:(UIPageControl *)pageControl
{
    //点击效果
    long currentPage =  pageControl.currentPage;
    
    CGPoint offset = CGPointMake(currentPage * self.frame.size.width, 0);
    [self.photoScrollView setContentOffset:offset animated:YES];
    
    
}
/**
 *  按钮点击次数响应
 *
 *  @param sender
 */
- (void)clickBtnPop:(UIButton *)sender
{
    //隐藏 详情价格
    UIView * detailPrice = [[UIView alloc] initWithFrame:CGRectMake(0, 210, main_wight, 50)];
    detailPrice.backgroundColor = [UIColor colorWithRed:0.863 green:0.863 blue:0.875 alpha:1.000];
    
    
    UIView * whiteView = [[UIView alloc] initWithFrame:CGRectMake(10, 210, main_wight-20, 50)];
    whiteView.backgroundColor = [UIColor whiteColor];
    
    
    if (sender.tag == 1) {
       [self.contentView addSubview:detailPrice];
        [self.contentView addSubview:whiteView];
        [detailPrice bringSubviewToFront:whiteView];
        sender.tag = 2;
    }else if(sender.tag == 2){
        [whiteView setHidden:YES];
        [detailPrice setHidden:YES];
        sender.tag = 1;
    }
    
    
}
- (void)attendClick:(UIButton *)sender
{
    
}
@end
