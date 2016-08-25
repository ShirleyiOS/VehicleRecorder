//
//  UIBarButtonItem+XY.h
//  MagicBox
//
//  Created by ecsage on 16/5/11.
//  Copyright © 2016年 ecsage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XY)

+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title normalColor:(UIColor *)normalColor highColor:(UIColor *)highColor disabledColor:(UIColor *)disabledColor target:(id)target action:(SEL)action;

@end
