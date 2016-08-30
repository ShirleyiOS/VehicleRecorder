//
//  YLVideoSquareHeadView.m
//  VehicleRecorder
//
//  Created by 王爽 on 16/8/27.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import "YLVideoSquareHeadView.h"
#import "UIImageLoopScrollView.h"
#import "YLCategoryBtn.h"


@implementation YLVideoSquareHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageLoopScrollView *loopView = [[UIImageLoopScrollView alloc] initWithImageArray:CGRectMake(0, 0, kScreenWidth, kScreenWidth / 2) imageArray:@[[UIImage imageNamed:@"广告"],[UIImage imageNamed:@"广告"],[UIImage imageNamed:@"广告"]]];
        loopView.scrollTime = 2.0;
        [self addSubview:loopView];
        NSArray *imageArray = @[@"img_shortcut_activity",@"img_shortcut_queryBreakRules",@"img_shortcut_nearby",@"img_shortcut_vedio"];
        NSArray *titleArray = @[@"盯盯活动",@"违章查询",@"查看附近",@"官方视频"];
        CGFloat btnWidth = kScreenWidth / imageArray.count;
        CGFloat btnHeight = 70;
        for (int i = 0; i < imageArray.count; i++) {
            YLCategoryBtn *btn = [[YLCategoryBtn alloc] initWithFrame:CGRectMake(i * btnWidth, loopView.height + 10, btnWidth, btnHeight)];
            [btn setTitle:titleArray[i] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
            [self addSubview:btn];
        }
    }
    return self;
}

@end
