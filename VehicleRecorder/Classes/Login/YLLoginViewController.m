//
//  YLLoginViewController.m
//  VehicleRecorder
//
//  Created by 王爽 on 16/8/29.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import "YLLoginViewController.h"
#import "YLRegisterViewController.h"
#import "YLForgotPswordViewController.h"
@interface YLLoginViewController ()
@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *pswordField;
@end

@implementation YLLoginViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"用户登陆", nil);
    [self initUI];
}

- (void)initUI{
    CGFloat userImageViewWidth = 150;
    CGFloat userImageViewHeight = userImageViewWidth;
    UIImageView *userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_user_default"]];
    userImageView.center = CGPointMake(kScreenWidth / 2, 90);
    userImageView.bounds = CGRectMake(0, 0, userImageViewWidth, userImageViewHeight);
    [self.view addSubview:userImageView];
    CGFloat margin = 10;
    CGFloat fieldViewHeight = 100;
    UIView *fieldView = [[UIView alloc] initWithFrame:CGRectMake(margin, userImageView.bottom + 25, kScreenWidth - 2 * margin, fieldViewHeight)];
    [self.view addSubview:fieldView];
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:fieldView.bounds];
    backImageView.image = [UIImage resizedImageWithName:@"login_background"];
    [fieldView addSubview:backImageView];
    _nameField = [[UITextField alloc] initWithFrame:CGRectMake(margin, 0, fieldView.width - 2 * margin, fieldView.height / 2)];
    _nameField.placeholder = @"请输入手机号";
    [fieldView addSubview:_nameField];
    _pswordField = [[UITextField alloc] initWithFrame:CGRectMake(margin, _nameField.bottom, _nameField.width, _nameField.height)];
    _pswordField.placeholder = @"密码";
    [fieldView addSubview:_pswordField];
    // 登陆
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin, fieldView.bottom + 30, fieldView.width, 50)];
    loginBtn.backgroundColor = kDefaultColor;
    [loginBtn setTitle:NSLocalizedString(@"登陆", nil) forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    // 忘记密码
    UIButton *forgotPswordBtn = [[UIButton alloc] init];
    [forgotPswordBtn setTitle:NSLocalizedString(@"忘记密码", nil) forState:UIControlStateNormal];
    forgotPswordBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [forgotPswordBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    CGFloat forgotPswordBtnWidth = [forgotPswordBtn.titleLabel.text widthForFont:forgotPswordBtn.titleLabel.font];
    CGFloat btnHeight = 40;
    forgotPswordBtn.frame = CGRectMake(kScreenWidth - margin - forgotPswordBtnWidth, loginBtn.bottom, forgotPswordBtnWidth, btnHeight);
    [forgotPswordBtn addTarget:self action:@selector(forgotPswordBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgotPswordBtn];
    // 注册
    UIButton *registerBtn = [[UIButton alloc] init];
    [registerBtn setTitle:NSLocalizedString(@"注册", nil) forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    CGFloat registerBtnWidth = [registerBtn.titleLabel.text widthForFont:registerBtn.titleLabel.font];
    registerBtn.frame = CGRectMake(forgotPswordBtn.left - margin - registerBtnWidth, loginBtn.bottom, registerBtnWidth, btnHeight);
    [registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
}

- (void)loginBtnClick:(UIButton *)button{
    
}

- (void)registerBtnClick:(UIButton *)button{
    YLRegisterViewController *vc = [[YLRegisterViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)forgotPswordBtnClick:(UIButton *)button{
    YLForgotPswordViewController *vc = [[YLForgotPswordViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
