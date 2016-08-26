//
//  YLBaseViewController.m
//  VehicleRecorder
//
//  Created by ecsage on 16/8/24.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import "YLBaseViewController.h"

@implementation YLBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    // 更改状态栏颜色
    [kApplication setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // 设置背景色
    self.view.backgroundColor = MyColorFromHex(0xf3f3f3);    
    
    // 设置导航返回键
    UIBarButtonItem *leftItem =  [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    //    UIImage* image = [UIImage imageNamed:@"nav-backBtn"];
    UIImage* image = [UIImage imageNamed:@"navBack-white"];
    [leftItem setBackButtonBackgroundImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(0, image.size.width, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    self.navigationItem.backBarButtonItem = leftItem;
}

- (void)clearData:(NSMutableArray *)dataArr
{
    [dataArr removeAllObjects];
    dataArr = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // 清除图片内存缓存
    //    [[YYImageCache sharedCache].memoryCache removeAllObjects];
    // 清除图片内存缓存
    //    [[SDImageCache sharedImageCache] clearMemory];
}


@end
