//
//  TopTableViewCell.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "TopTableViewCell.h"
#import "URLHeaders.h"
#import "UIImageView+WebCache.h"
@implementation TopTableViewCell

- (void)setDetail:(Detail *)detail
{
    if (_detail != detail) {
        _detail = detail;
    }
    _titleLabel.text = _detail.floatStr;
    _address.text = _detail.addressesStr;
    NSURL * url = [_detail.pic_details_photos objectAtIndex:0];
    
    [_photoView sd_setImageWithURL:url];
    
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, main_wight, 120)];
        headerView.backgroundColor = [UIColor whiteColor];
        
        //图片
        _photoView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, main_wight*1/3+ 20, 100)];
        _photoView.image = [UIImage imageNamed:@"1"];
        [headerView addSubview:_photoView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(main_wight*1/3+45, 10, main_wight*2/3-50, 50)];
        _titleLabel.numberOfLines = 0;
        
        [headerView addSubview:_titleLabel];
        
        _address = [[UILabel alloc] initWithFrame:CGRectMake(main_wight*1/3+55, 60, main_wight*2/3-70, 40)];
        _address.font = [UIFont systemFontOfSize:13];
        _address.numberOfLines = 0;
        [headerView addSubview:_address];
        
        
        [self.contentView addSubview:headerView];
        
        
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
