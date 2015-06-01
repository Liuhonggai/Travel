//
//  DetailTableViewCell.m
//  HappyWeekend
//
//  Created by lanou3g on 15/5/22.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "URLHeaders.h"

@implementation DetailTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#warning cell内容自适应---------
- (void)setCellWithDetail:(Detail *)deta
{
    _timeLabel.text = deta.timeStr;
    _content.text = deta.content;
    _tips_show_label.text =deta.tips_show;
    
    [self adaptionHeigh];
    
}
- (void)adaptionHeigh
{
    _content.text = [_content.text stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    _content.text = [_content.text stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    _content_height= [[self class] getTextHeightForText:_content.text fontSize:15.0 Width:main_wight-30];
    CGRect frame = _content.frame;
    frame.size.height = _content_height;
    _content.frame = frame;
    
    _tips_show_label.text = [_tips_show_label.text stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    CGFloat tipsHeight =[[self class] getTextHeightForText:_tips_show_label.text fontSize:15.0 Width:main_wight-60];
    CGRect tipsFrame = _tips_show_label.frame;
    tipsFrame.size.height = tipsHeight + _content_height *2 +30
    ;
    _tips_show_label.frame = tipsFrame;

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self foundFixView];
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 46, main_wight-20, 35)];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_timeLabel];
        
        //内容
        _content = [[UILabel alloc] initWithFrame:CGRectMake(15, 110, main_wight-30, 15)];
        _content.numberOfLines = 0;
        [_content setFont:[UIFont systemFontOfSize:15.0]];
        [self.contentView addSubview:_content];
        
        
        _tips_show_label = [[UILabel alloc] initWithFrame:CGRectMake(30, 110 , main_wight-60, 20)];
        _tips_show_label.numberOfLines = 0;
        _tips_show_label.textColor = [UIColor redColor];
         [_tips_show_label setFont:[UIFont systemFontOfSize:15.0]];
        [self.contentView addSubview:_tips_show_label];
        
        
        
        
        
    }
    return self;
}
/**
 *  创建不可变的View
 */
- (void)foundFixView
{
    UIView * titleView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 5, 18)];
    titleView.backgroundColor = [UIColor colorWithRed:0.247 green:0.733 blue:0.812 alpha:1.000];
    [self.contentView addSubview:titleView];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 8, main_wight, 20)];
    titleLabel.text = @"活动详细";
    titleLabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:titleLabel];
    
    //时间
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, main_wight, 50)];
    backView.backgroundColor = [UIColor colorWithRed:0.831 green:0.929 blue:0.941 alpha:1.000];
    [self.contentView addSubview:backView];
}
@end
