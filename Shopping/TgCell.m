//
//  TgCell.m
//  Shopping
//
//  Created by HZhenF on 17/4/7.
//  Copyright © 2017年 筝风放风筝. All rights reserved.
//

#import "TgCell.h"

@implementation TgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellInit:(UITableView *)tableView
{
    static NSString *identifier = @"tg";
    TgCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

-(void)setModel:(TGModel *)model
{
    _model = model;
    self.icon.image = [UIImage imageNamed:model.icon];
    self.titleLabel.text = model.title;
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",model.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已购买",model.buyCount];
}

@end
