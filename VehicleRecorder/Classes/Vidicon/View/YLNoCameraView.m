//
//  YLNoCameraView.m
//  VehicleRecorder
//
//  Created by 王爽 on 16/8/26.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import "YLNoCameraView.h"




@implementation YLNoCameraView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *connectCamera = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"connect_camera"]];
        connectCamera.center = CGPointMake(kScreenWidth / 2, 150);
        [self addSubview:connectCamera];
        UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, connectCamera.frame.size.height + connectCamera.frame.origin.y + 10, kScreenWidth, 20)];
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.text = NSLocalizedString(@"您还没有添加摄像机", nil);
        tipLabel.textColor = [UIColor lightGrayColor];
        tipLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:tipLabel];
        CGFloat btnWidth = 80;
        CGFloat btnHeight = 50;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth - btnWidth) * 0.5, tipLabel.frame.size.height + tipLabel.frame.origin.y + 20, btnWidth, btnHeight)];
        [btn setTitle:NSLocalizedString(@"添加", nil) forState:UIControlStateNormal];
        [btn setTitleColor:kDefaultColor forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:btn];
        
    }
    return self;
}

- (void)btnClick:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(addCameraBtnClick:)]) {
        [self.delegate addCameraBtnClick:sender];
    }
}

@end
