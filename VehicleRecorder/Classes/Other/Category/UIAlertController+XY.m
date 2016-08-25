//
//  UIAlertController+XY.m
//  MagicBox
//
//  Created by ecsage on 16/5/13.
//  Copyright © 2016年 ecsage. All rights reserved.
//

#import "UIAlertController+XY.h"

@implementation UIAlertController (XY)

+ (UIAlertController *)addOneTextFieldAlertControllerWithTitle:(NSString *)title message:(NSString *)message text:(NSString *)text keyboardType:(UIKeyboardType)type handler:(void (^)(UITextField *textFeild))handler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = text;
        if (type != 0) {
            textField.keyboardType = type;
        }
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (handler) {
            handler(alertController.textFields.firstObject);
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    return alertController;
}

+ (UIAlertController *)addOneTextFieldAlertControllerWithTitle:(NSString *)title message:(NSString *)message text:(NSString *)text handler:(void (^)(UITextField *textFeild))handler {
    UIAlertController *alertController = [self addOneTextFieldAlertControllerWithTitle:title message:message text:text keyboardType:UIKeyboardTypeDefault handler:handler];
    return alertController;
}

@end
