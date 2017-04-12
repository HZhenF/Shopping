//
//  TgCell.h
//  Shopping
//
//  Created by HZhenF on 17/4/7.
//  Copyright © 2017年 筝风放风筝. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TGModel.h"

@interface TgCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

@property(nonatomic,strong) TGModel *model;

+(instancetype)cellInit:(UITableView *)tableView;

@end
