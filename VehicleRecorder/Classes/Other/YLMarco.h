//
//  YLMarco.h
//  VehicleRecorder
//
//  Created by ecsage on 16/8/24.
//  Copyright © 2016年 auvi. All rights reserved.
//

#ifndef YLMarco_h
#define YLMarco_h

// 1.判断是否为iOS7\iOS8\iOS9
#define kCurSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]
#define iOS7 (kCurSystemVersion >= 7.0 && kCurSystemVersion < 8.0)// iOS7
#define iOS7UP (kCurSystemVersion >= 7.0)// iOS7以上
#define iOS8 (kCurSystemVersion >= 8.0 && kCurSystemVersion < 9.0)// iOS8
#define iOS9UP (kCurSystemVersion >= 9.0)// iOS9

// 2.获得RGB颜色
#define MYColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0] // 不透明
#define MYColorWithAlpha(x,y,z,a) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:a] // 带有透明度
// 随机颜色
#define MYColorRandom MYColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))

// hex颜色
#define MyColorFromHex(_f)  [UIColor colorWithRed:((float)((_f & 0xFF0000) >> 16))/255.0 \
green:((float)((_f & 0xFF00)    >> 8))/255.0 \
blue:((float) (_f & 0xFF)           )/255.0 \
alpha:1.0]

// 不透明的hex颜色转换
#define MyColorFromHexWithAlpha(_f, _a)  [UIColor colorWithRed:((float)((_f & 0xFF0000) >> 16))/255.0 \
green:((float)((_f & 0xFF00)    >> 8))/255.0 \
blue:((float) (_f & 0xFF)           )/255.0 \
alpha:(_a)] // 带有透明度的hex颜色转换

// 3.自定义Log
#ifdef DEBUG
#define MSLog(...) NSLog(__VA_ARGS__)
#else
#define MSLog(...)
#endif

// 4.屏幕大小
#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define is3_5Inch (isFloatEqualZero(kScreenWidth,320.0) && isFloatEqualZero(kScreenHeight,480.0))
#define is4Inch (isFloatEqualZero(kScreenWidth,320.0) && isFloatEqualZero(kScreenHeight,568.0))// 4英寸屏幕,6放大模式也是这个分辨率
#define isMoreThan4Inch ((kScreenWidth > 320.0 && kScreenHeight > 568.0))// 不包括4英寸
#define is4_7Inch (isFloatEqualZero(kScreenWidth,375.0) && isFloatEqualZero(kScreenHeight,667.0))// 4.7英寸屏幕，6plus放大模式也是这个分辨率
#define is5_5Inch (isFloatEqualZero(kScreenWidth,414.0) && isFloatEqualZero(kScreenHeight,736.0))// 5.5英寸屏幕

#define isiPad ((kScreenWidth == 1024) && (kScreenHeight == 768)) // 普通ipad
#define isiPadPro ((kScreenWidth == 1366) && (kScreenHeight == 1024)) // ipad pro

// 其他宽高度数据
#define kNavigationBarAndStatusBarHeight 64.0f // 导航栏加状态栏高度
#define kNavigationBarHeight 44.0f // 导航栏高度
#define kStatusBarHeight 20.0f //状态栏高度
#define kTabbarHeight 49.0f // tabBar高度
#define kKeyboardHeight 216 // 键盘高度
// iPad横屏模式下的宽度 和 高度
//#define kiPadLandscapeWeight 1024
//#define kiPadLandscapeHeight 768
//// iPad竖屏模式下的宽度 和 高度
//#define kiPadPortraitWeight 768
//#define kiPadPortraitHeight 1024

// custom tabbar 宽度
#define kCustomTabbarWeight 140

// 常用类
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kApplication        [UIApplication sharedApplication]
#define kAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define kFileManager        [NSFileManager defaultManager]
#define kMainScreenBounds   [[UIScreen mainScreen] bounds]
#define kEaseMob [EaseMob sharedInstance]

// 文件夹
#define kNSDocumentDirectory         [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#endif /* YLMarco_h */



/**
 *  VehicleRecorder
 */
#define kDefaultColor   MYColor(237, 80, 71)




