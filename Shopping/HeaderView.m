//  HeaderView.m
//  Shopping
//
//  Created by HZhenF on 17/4/7.
//  Copyright © 2017年 筝风放风筝. All rights reserved.
//

#import "HeaderView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define scrollViewWidth [UIScreen mainScreen].bounds.size.width * 0.8
#define ScrollViewHeight ([UIScreen mainScreen].bounds.size.height - 20) * 0.2


@implementation HeaderView

-(UIView *)view
{
    if (!_view) {
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScrollViewHeight + 40)];
        UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(self.scrollView.frame) + 5, ScreenWidth - 10, 1)];
        topLine.backgroundColor = [UIColor grayColor];
        [_view addSubview:topLine];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.scrollView.frame), CGRectGetMaxY(topLine.frame) + 5, 100, 10)];
        label.text = @"猜你喜欢";
        label.font = [UIFont systemFontOfSize:12.0];
        [_view addSubview:label];
        UIView *bottom = [[UIView alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(label.frame) + 5, ScreenWidth - 10, 1)];
        bottom.backgroundColor = [UIColor grayColor];
        [_view addSubview:bottom];
        self.myFrame = _view.frame;
    }
    return _view;
}

-(NSTimer *)myTimer
{
    if (!_myTimer) {
        _myTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_myTimer forMode:NSRunLoopCommonModes];
    }
    return _myTimer;
}

-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake((ScreenWidth - scrollViewWidth) * 0.5, 5, scrollViewWidth, ScrollViewHeight)];
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = CGSizeMake(scrollViewWidth * 5, 0);
     
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

-(UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.scrollView.frame.origin.x, CGRectGetMaxY(self.scrollView.frame) - 29, CGRectGetWidth(self.scrollView.frame), 29)];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.backgroundColor = [UIColor whiteColor];
        _pageControl.alpha = 0.5;
        [self.view addSubview:_pageControl];
    }
    return _pageControl;
}

//布局5个图片
-(void)pictureLayout
{
    for (int i = 0; i < 5; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * CGRectGetWidth(self.scrollView.frame), 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"ad_%02d.png", i ]];
        [self.scrollView addSubview:imageView];
    }
}

//自动到下一页
-(void)nextPage
{
    NSInteger currentPage = self.pageControl.currentPage;
    currentPage ++;
    if (currentPage == 5) {
        currentPage = 0;
    }
    [self.scrollView setContentOffset:CGPointMake(currentPage * scrollViewWidth, 0) animated:YES];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.pageControl.numberOfPages = 5;
        self.scrollView.delegate = self;
        [self pictureLayout];
        [self addSubview:self.view];
        [self myTimer];
    }
    return self;
}

//scrollView已经滑动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //page第一个点是0
    self.pageControl.currentPage = (self.scrollView.contentOffset.x + self.scrollView.bounds.size.width * 0.5)/self.scrollView.bounds.size.width;
}

//scrollView结束拖动
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self myTimer];
    
}

//scrollView开始拖动
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.myTimer invalidate];
    self.myTimer = nil;
    
}

@end
