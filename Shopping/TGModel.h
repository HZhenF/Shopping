//
//  TGModel.h
//  Shopping
//
//  Created by HZhenF on 17/4/7.
//  Copyright © 2017年 筝风放风筝. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGModel : UIView

@property(nonatomic,strong) NSString *buyCount;

@property(nonatomic,strong) NSString *icon;

@property(nonatomic,strong) NSString *price;

@property(nonatomic,strong) NSString *title;

@property(nonatomic,strong,readonly) UIImage *image;

+(instancetype)TGModelWithDict:(NSDictionary *)dict;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(NSArray *)modelArray;

@end

