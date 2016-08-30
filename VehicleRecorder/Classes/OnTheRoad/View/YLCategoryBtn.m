//
//  YLCategoryBtn.m
//  VehicleRecorder
//
//  Created by 王爽 on 16/8/27.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import "YLCategoryBtn.h"


#define kRatio 0.8
@implementation YLCategoryBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 文字颜色
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        // 图标居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height * kRatio);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, contentRect.size.height * kRatio, contentRect.size.width, contentRect.size.height * (1- kRatio));
}


@end
