//
//  YLNavigationController.m
//  VehicleRecorder
//
//  Created by ecsage on 16/8/24.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import "YLNavigationController.h"

@interface YLNavigationController ()

@end

@implementation YLNavigationController

/**
 *  第一次使用这个类的时候会调用(1个类只会调用1次)
 */
+ (void)initialize
{
    // 设置导航栏主题
    [self setupNavBarTheme];
    
    // 设置导航栏按钮主题
    [self setupBarButtonItemTheme];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setupBackgroundImg];
}

/**
 *  设置背景图片
 */
- (void)setupBackgroundImg {
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    //    navBar.tintColor = [UIColor whiteColor];
    
    // 设置背景
    UIImage *backgroundImg = [UIImage imageNamed:@"tabbar底色-黑"];
    [navBar setBackgroundImage:backgroundImg forBarMetrics:UIBarMetricsDefault];
}

/**
 *  设置导航栏主题
 */
+ (void)setupNavBarTheme
{
    // 取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    //    navBar.tintColor = [UIColor whiteColor];
    
    // 设置背景
    //        UIImage *backgroundImg = [UIImage imageNamed:@"导航栏底色-黄"];
    //    [navBar setBackgroundImage:backgroundImg forBarMetrics:UIBarMetricsDefault];
    
    //    navBar.barTintColor = MyColorFromHex(0x39A1EA);
    // 设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:19];
    textAttrs[NSFontAttributeName] = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [navBar setTitleTextAttributes:textAttrs];
    
    // 去掉底部shadow黑线
    [navBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(kScreenWidth, 3)]];
}

/**
 *  设置导航栏按钮主题
 */
+ (void)setupBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18.0];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //    NSMutableDictionary *highlightedTextAttrs = [NSMutableDictionary dictionary];
    //    highlightedTextAttrs[NSForegroundColorAttributeName] = MYColor(213.0, 169.0, 51.0);
    //    [item setTitleTextAttributes:highlightedTextAttrs forState:UIControlStateHighlighted];
    
    //    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    //    disableTextAttrs[NSForegroundColorAttributeName] =  MYColor(239.0, 174.0, 0.0);
    //    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.translucent = YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;// 自动隐藏tabbar
    }
    [super pushViewController:viewController animated:animated];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
