//
//  TGModel.m
//  Shopping
//
//  Created by HZhenF on 17/4/7.
//  Copyright © 2017年 筝风放风筝. All rights reserved.
//

#import "TGModel.h"

@interface TGModel()

@property(nonatomic,strong) UIImage *image;

@end

@implementation TGModel

+(NSArray *)modelArray
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"]];
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrM addObject:[TGModel TGModelWithDict:dict]];
    }
    return arrM;
}

+(instancetype)TGModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

-(UIImage *)image
{
    if (!_image) {
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}

@end
