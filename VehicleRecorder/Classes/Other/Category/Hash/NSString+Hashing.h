//
//  GGELoginViewController.m
//  GGEWaltzNew
//
//  Created by yan on 15/10/26.
//  Copyright © 2015年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Hashing)
/**
 *  MD5 16位加密
 */
- (NSString *)getMD5Hash;

+ (NSString*)fileMD5:(NSString*)path;

+ (NSString*)dataMD5:(NSData*)data;
@end
