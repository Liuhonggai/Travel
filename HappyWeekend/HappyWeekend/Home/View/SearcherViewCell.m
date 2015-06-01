//
//  SearcherViewCell.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "SearcherViewCell.h"
#import "UIImageView+WebCache.h"
#import "NetworkHandler.h"
@implementation SearcherViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView * imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3.png"]];
        imgV.frame = CGRectMake(10, 0, 40, 40);
        self.imgV = imgV;
       [self.contentView addSubview:imgV];
        
    
        UILabel * typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 0, [[UIScreen mainScreen]bounds].size.width-60, 40)];
        typeLabel.text = @"全部活动";
        self.typeLabel = typeLabel;
        [self.contentView addSubview:typeLabel];
        
    }
    return self;
}
-(void)setHomelist:(HomeListTwo *)homelist
{
    if (_homelist != homelist) {
        _homelist = homelist;
    }
    NSURL * url = [NSURL URLWithString:homelist.genre_main_pic_show];
    [self.imgV  sd_setImageWithURL:url];
    
    self.typeLabel.text = homelist.genre_main_show;
    
    
    
    
    
}
 

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    
//    
//    // Configure the view for the selected state
//}

@end
