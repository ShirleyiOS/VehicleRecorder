//
//  YLForgotPswordViewController.m
//  VehicleRecorder
//
//  Created by 王爽 on 16/8/29.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import "YLForgotPswordViewController.h"

@interface YLForgotPswordViewController ()
@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *pswordField;
@property (nonatomic, strong) UITextField *codeField;
@end

@implementation YLForgotPswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"忘记密码", nil);
    
    [self initUI];
}

- (void)initUI{
    CGFloat margin = 10;
    CGFloat height = 40;
    _nameField = [[UITextField alloc] initWithFrame:CGRectMake(margin, 20, kScreenWidth - 2 * margin, height)];
    _nameField.placeholder = NSLocalizedString(@"请输入手机号", nil);
    [self.view addSubview:_nameField];
    _pswordField = [[UITextField alloc] initWithFrame:CGRectMake(margin, _nameField.bottom + margin, _nameField.width, _nameField.height)];
    _pswordField.placeholder = NSLocalizedString(@"密码", nil);
    [self.view addSubview:_pswordField];
    _codeField = [[UITextField alloc] initWithFrame:CGRectMake(margin, _pswordField.bottom + margin, _pswordField.width, _pswordField.height)];
    _codeField.placeholder = NSLocalizedString(@"验证码", nil);
    [self.view addSubview:_codeField];
    UIButton *getCodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin, _codeField.bottom + margin, _nameField.width, height)];
    [getCodeBtn setTitle:NSLocalizedString(@"获取验证码", nil) forState:UIControlStateNormal];
    getCodeBtn.backgroundColor = kDefaultColor;
    [self.view addSubview:getCodeBtn];
    UIButton *commitBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin, getCodeBtn.bottom + margin, _nameField.width, height)];
    [commitBtn setTitle:NSLocalizedString(@"提交", nil) forState:UIControlStateNormal];
    commitBtn.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:commitBtn];
}


@end
