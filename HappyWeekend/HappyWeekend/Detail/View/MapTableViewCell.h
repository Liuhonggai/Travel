//
//  MapTableViewCell.h
//  UINAV
//
//  Created by lanou3g on 15/5/21.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Detail.h"
@interface MapTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel * siteLabel;
@property (nonatomic, strong)UILabel * addressesLabel;

@property (nonatomic, strong)Detail * detail;
@end
