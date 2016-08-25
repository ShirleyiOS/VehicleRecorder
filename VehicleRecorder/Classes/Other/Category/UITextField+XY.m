//
//  UITextField+XY.m
//  MagicBox
//
//  Created by ecsage on 16/5/9.
//  Copyright © 2016年 ecsage. All rights reserved.
//

#import "UITextField+XY.h"

@implementation UITextField (XY)

- (BOOL)validateNumber
{
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < self.text.length) {
        NSString * string = [self.text substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}

- (BOOL)isVoidText
{
    if (self.text.length == 0) {
        return YES;
    }
    return NO;
}

- (BOOL)isValidPassword
{
    if (self.text.length >= 6 && self.text.length <= 12) {
        return YES;
    }
    return NO;
}

- (BOOL)isValidPhoneNum
{
    NSString * regex = @"^.{11}$";
    return [self predicateWithRegex:regex];
}

- (BOOL)isFittedWithLength:(int)length
{
    if (self.text.length == length) {
        return YES;
    }
    return NO;
}

- (BOOL)isValidEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self predicateWithRegex:regex];
}

- (BOOL)isValidateIdentityCard
{
    BOOL flag;
    if (self.text.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    return [self predicateWithRegex:regex];
}

#pragma mark - 私有
/**
 *  传入正则表达式与当前的text进行比对并且返回结果
 */
- (BOOL)predicateWithRegex:(NSString *)regex
{
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self.text];
    return isMatch;
}

@end
