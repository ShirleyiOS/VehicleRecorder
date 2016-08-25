//
//  UITextField+XY.h
//  MagicBox
//
//  Created by ecsage on 16/5/9.
//  Copyright © 2016年 ecsage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (XY)

/**
 *  判断是否为数字，否则不能输入
 */
- (BOOL)validateNumber;
/**
 *  是否为空文本
 */
- (BOOL)isVoidText;
/**
 *  是否为有效的密码
 *  （在这里只需要判断是不是6-18位数就可以了，如需更详细判断请用正则）
 */
- (BOOL)isValidPassword;
/**
 *  是否为有效手机号码
 *（在这里只需要判断是否为11位数字）
 */
- (BOOL)isValidPhoneNum;
/**
 *  根据长度判断是否符合要求
 */
- (BOOL)isFittedWithLength:(int)length;
/**
 *  判断是否邮箱格式文本
 */
- (BOOL)isValidEmail;
/**
 *  是否符合身份证格式
 */
- (BOOL)isValidateIdentityCard;

@end
