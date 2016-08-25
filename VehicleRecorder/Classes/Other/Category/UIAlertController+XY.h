//
//  UIAlertController+XY.h
//  MagicBox
//
//  Created by ecsage on 16/5/13.
//  Copyright © 2016年 ecsage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (XY)

+ (UIAlertController *)addOneTextFieldAlertControllerWithTitle:(NSString *)title message:(NSString *)message text:(NSString *)text handler:(void (^)(UITextField *textFeild))handler;
+ (UIAlertController *)addOneTextFieldAlertControllerWithTitle:(NSString *)title message:(NSString *)message text:(NSString *)text keyboardType:(UIKeyboardType)type handler:(void (^)(UITextField *textFeild))handler;

@end
