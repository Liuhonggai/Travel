//
//  MapTableViewCell.m
//  UINAV
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "MapTableViewCell.h"
#import "URLHeaders.h"
@interface MapTableViewCell()

@end


@implementation MapTableViewCell
//重写set方法
- (void)setDetail:(Detail *)detail
{
    _detail = detail;
    
    self.siteLabel.text = detail.siteStr;
    self.addressesLabel.text = detail.addressesStr;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, main_wight, 100)];
        backView.backgroundColor = [UIColor colorWithWhite:0.947 alpha:0.930];
        
        [self.contentView addSubview:backView];
        
        UIView * backView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 10, main_wight, 80)];
        backView1.backgroundColor = [UIColor whiteColor];
        [backView addSubview:backView1];
        
        
        _siteLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, main_wight-80, 40)];
        _siteLabel.numberOfLines = 0;
        _siteLabel.font = [UIFont systemFontOfSize:16];
        [backView1 addSubview:_siteLabel];
        
        _addressesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, main_wight-80, 20)];
        _addressesLabel.font = [UIFont systemFontOfSize:13];
        _addressesLabel.numberOfLines = 0;
        [backView1 addSubview:_addressesLabel];
        
        UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(main_wight-70, 10, 40, 50)];
        image.image = [UIImage imageNamed:@"20150601055141372_easyicon_net_32"];
        [backView1 addSubview:image];
        
    }
    return self;
}
@end
