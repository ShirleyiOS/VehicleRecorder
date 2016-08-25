//
//  UITableViewCell+XY.m
//  Diamondprice2
//
//  Created by yan on 15/11/9.
//  Copyright © 2015年 waltz. All rights reserved.
//

#import "UITableViewCell+XY.h"

@implementation UITableViewCell (XY)

+ (NSString *)cellClassName
{
    NSString *className = [NSString stringWithUTF8String:object_getClassName(self)];
    return className;
}

@end
