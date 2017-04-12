//
//  HeaderView.h
//  Shopping
//
//  Created by HZhenF on 17/4/7.
//  Copyright © 2017年 筝风放风筝. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView<UIScrollViewDelegate>

@property(nonatomic,strong) UIView *view;

@property(nonatomic,strong) NSTimer *myTimer;

@property(nonatomic,strong) UIScrollView *scrollView;

@property(nonatomic,strong) UIPageControl *pageControl;

@property(nonatomic,assign) CGRect myFrame;


@end
