//
//  YLPersonalViewController.m
//  VehicleRecorder
//
//  Created by ecsage on 16/8/25.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import "YLPersonalViewController.h"
#import "YLLoginViewController.h"
@interface YLPersonalViewController()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UIView *backView;
@end


#define kHeadViewHeight 200.0

@implementation YLPersonalViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"我", nil);
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.contentInset = UIEdgeInsetsMake(kHeadViewHeight, 0, 0, 0);
    _backView = [[UIView alloc] initWithFrame:CGRectMake(0, -kHeadViewHeight, kScreenWidth, kHeadViewHeight)];
    _backView.backgroundColor = kDefaultColor;
    [_tableView addSubview:_backView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_tableView];
    _dataArray = @[@[@{@"mine_activity":@"我的活动"}],@[@{@"mine_set":@"设置"}],@[@{@"mine_help":@"帮助"},@{@"mine_about":@"关于"}]];
    [self createNoLoginHeadView];
}

- (void)createNoLoginHeadView{
   // UIButton *messageBtn =
    CGFloat loginBtnWidth = 100;
    CGFloat loginBtnHeight = 40;
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth - loginBtnWidth) * 0.5, (_backView.height - loginBtnHeight) * 0.5, loginBtnWidth, loginBtnHeight)];
    [loginBtn setTitle:@"登陆/注册" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_backView addSubview:loginBtn];
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, loginBtn.bottom , kScreenWidth, 30)];
    tipLabel.text = @"登陆后可使用更多功能";
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.font = [UIFont systemFontOfSize:12];
    tipLabel.textColor = [UIColor whiteColor];
    [_backView addSubview:tipLabel];
}

- (void)loginBtnClick:(UIButton *)button{
    YLLoginViewController *vc = [[YLLoginViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.y < -kHeadViewHeight) {
        CGRect rect = _backView.frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        _backView.frame = rect;
    }
}

@end
