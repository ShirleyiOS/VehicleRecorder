//
//  YLVidiconViewController.m
//  VehicleRecorder
//
//  Created by ecsage on 16/8/25.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import "YLVidiconViewController.h"
#import "YLNoCameraView.h"
@interface YLVidiconViewController() <YLNoCameraViewDelegate>
@property (nonatomic, strong) YLNoCameraView *noCameraView;
@end

@implementation YLVidiconViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = NSLocalizedString(@"摄像机", nil);
    [self createNoCameraView];
}

- (void)createNoCameraView{
    _noCameraView = [[YLNoCameraView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_noCameraView];
    _noCameraView.delegate = self;
}

#pragma mark - YLNoCameraViewDelegate

- (void)addCameraBtnClick:(UIButton *)button{
    
}

@end
