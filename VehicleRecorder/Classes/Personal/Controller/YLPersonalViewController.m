//
//  YLPersonalViewController.m
//  VehicleRecorder
//
//  Created by ecsage on 16/8/25.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import "YLPersonalViewController.h"

@interface YLPersonalViewController()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UIView *headView;
@end


@implementation YLPersonalViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_tableView];
    [self createHeadView];
    _dataArray = @[@[@{@"mine_activity":@"我的活动"}],@[@{@"mine_set":@"设置"}],@[@{@"mine_help":@"帮助"},@{@"mine_about":@"关于"}]];
}


- (void)createHeadView{
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth * 9.0/16.0)];
    _headView.backgroundColor = kDefaultColor;
    _tableView.tableHeaderView = _headView;
}


#pragma mark - tableViewDelegate&&DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *rowArray = _dataArray[section];
    return rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSDictionary *dataDict = _dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = dataDict.allValues[0];
    cell.imageView.image = [UIImage imageNamed:dataDict.allKeys[0]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001;
}

@end
