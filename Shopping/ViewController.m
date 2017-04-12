//
//  ViewController.m
//  Shopping
//
//  Created by HZhenF on 17/4/5.
//  Copyright © 2017年 筝风放风筝. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "TGModel.h"
#import "TgCell.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *tgArray;

@property(nonatomic,strong) HeaderView *headerView;

@property(nonatomic,strong) HeaderView *hd;

@end

@implementation ViewController

-(NSArray *)tgArray
{
    if (!_tgArray) {
        _tgArray = [TGModel modelArray];
    }
    return _tgArray;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.contentInset = UIEdgeInsetsMake(CGRectGetHeight(self.hd.frame), 0, 0, 0);
        [self.view addSubview:_tableView];
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    HeaderView *headerView = [[HeaderView alloc] init];
    headerView.frame = CGRectMake(0, -CGRectGetHeight(headerView.myFrame), CGRectGetWidth(headerView.myFrame), CGRectGetHeight(headerView.myFrame));
    self.hd = headerView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 80;
    
    [self.tableView addSubview:headerView];
}



-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - tableView的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TgCell *cell = [TgCell cellInit:tableView];
    TGModel *model = self.tgArray[indexPath.row];
    cell.model = model;
    
    return cell;
}



@end
