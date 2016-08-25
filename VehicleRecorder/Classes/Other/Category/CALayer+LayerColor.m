//
//  CALayer+LayerColor.m
//  VideoLucre
//
//  Created by ecsage on 16/7/15.
//  Copyright © 2016年 ecsage. All rights reserved.
//

#import "CALayer+LayerColor.h"

@implementation CALayer (LayerColor)

- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

@end
