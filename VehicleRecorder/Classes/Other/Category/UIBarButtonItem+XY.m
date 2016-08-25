//
//  UIBarButtonItem+XY.m
//  MagicBox
//
//  Created by ecsage on 16/5/11.
//  Copyright © 2016年 ecsage. All rights reserved.
//

#import "UIBarButtonItem+XY.h"

@implementation UIBarButtonItem (XY)

+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normalImg = [UIImage imageNamed:icon];
    [button setBackgroundImage:normalImg forState:UIControlStateNormal];
    if (highIcon) {
        UIImage *highlightedImg = [UIImage imageNamed:highIcon];
        [button setBackgroundImage:highlightedImg forState:UIControlStateHighlighted];
        [button setBackgroundImage:highlightedImg forState:UIControlStateDisabled];
    }
    button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title normalColor:(UIColor *)normalColor highColor:(UIColor *)highColor disabledColor:(UIColor *)disabledColor target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    
    if (normalColor) {
        [button setTitleColor:normalColor forState:UIControlStateNormal];
    }
    if (highColor) {
        [button setTitleColor:highColor forState:UIControlStateHighlighted];
    }
    if (disabledColor) {
        [button setTitleColor:disabledColor forState:UIControlStateDisabled];
    }
    
    button.titleLabel.font = [UIFont systemFontOfSize:16.0];
    CGRect rect = [title boundingRectWithSize:CGSizeMake(1000.0, 44.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:16.0] forKey:NSFontAttributeName] context:nil];
    //    JALog(@"%@",NSStringFromCGRect(rect));
    button.frame = rect;
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


@end
