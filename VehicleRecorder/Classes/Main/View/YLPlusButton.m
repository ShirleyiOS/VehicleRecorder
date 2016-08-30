//
//  YLPlusButton.m
//  VehicleRecorder
//
//  Created by ecsage on 16/8/25.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import "YLPlusButton.h"
#import "CYLTabBarController.h"
#import "YLCategoryBtn.h"
@implementation YLPlusButton{
    NSMutableArray *_btnArray;
}

+ (void)load {
    [super registerPlusButton];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

//上下结构的 button
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 控件大小,间距大小
    // 注意：一定要根据项目中的图片去调整下面的0.7和0.9，Demo之所以这么设置，因为demo中的 plusButton 的 icon 不是正方形。
    CGFloat const imageViewEdgeWidth   = self.bounds.size.width ;
    CGFloat const imageViewEdgeHeight  = imageViewEdgeWidth ;
    
    CGFloat const centerOfView    = self.bounds.size.width * 0.5;
    CGFloat const labelLineHeight = self.titleLabel.font.lineHeight;
    CGFloat const verticalMarginT = self.bounds.size.height - labelLineHeight - imageViewEdgeWidth;
    CGFloat const verticalMargin  = verticalMarginT / 2;
    
    // imageView 和 titleLabel 中心的 Y 值
    CGFloat const centerOfImageView  = verticalMargin + imageViewEdgeWidth * 0.5;
    CGFloat const centerOfTitleLabel = imageViewEdgeWidth  + verticalMargin * 2 + labelLineHeight * 0.5 + 5;
    
    //imageView position 位置
    self.imageView.bounds = CGRectMake(0, 0, imageViewEdgeWidth, imageViewEdgeHeight);
    self.imageView.center = CGPointMake(centerOfView, centerOfImageView);
    
    //title position 位置
    self.titleLabel.bounds = CGRectMake(0, 0, self.bounds.size.width, labelLineHeight);
    self.titleLabel.center = CGPointMake(centerOfView, centerOfTitleLabel);
    
}

#pragma mark -
#pragma mark - CYLPlusButtonSubclassing Methods

/*
 *
 Create a custom UIButton with title and add it to the center of our tab bar
 *
 */
+ (id)plusButton {
    YLPlusButton *button = [[YLPlusButton alloc] init];
    UIImage *buttonImage = [UIImage imageNamed:@"tab_img_add"];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:9.5];
    [button sizeToFit]; // or set frame in this way `button.frame = CGRectMake(0.0, 0.0, 250, 100);`
    //    button.frame = CGRectMake(0.0, 0.0, 250, 100);
    //    button.backgroundColor = [UIColor redColor];
    [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    return button;
}


#pragma mark -
#pragma mark - Event Response

- (void)clickPublish {
    CYLTabBarController *tabBarController = [self cyl_tabBarController];
    UIViewController *viewController = tabBarController.selectedViewController;
 
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    view.backgroundColor = [UIColor whiteColor];
    [viewController.view addSubview:view];
    viewController.tabBarController.tabBar.hidden = YES;
    
    NSArray *imageArray = @[@"otw_share_image",@"otw_share_video",@"otw_share_track",@"otw_share_report",@"otw_share_activity"];
    NSArray *titleArray = @[@"图片分享",@"视频分享",@"轨迹分享",@"违章举报",@"创建活动"];
    _btnArray = [NSMutableArray array];
    int col = 3;
    int btnWidth = kScreenWidth / col;
    int btnHeight = 100;
    for (int i = 0; i < imageArray.count; i++) {
        YLCategoryBtn *btn = [[YLCategoryBtn alloc] initWithFrame:CGRectMake(i % col  * btnWidth, i / col * btnHeight + (kScreenHeight - 300), btnWidth, btnHeight)];
        btn.tag = 1000 + i;
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [view addSubview:btn];
        [_btnArray addObject:btn];
        CGAffineTransform trans = CGAffineTransformTranslate(btn.transform, 0, kScreenHeight);
        btn.transform = trans;
        //清空偏移量的动画
        [UIView animateWithDuration:0.25 delay:i/10.0 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
            //清空偏移量
            btn.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            //抖动动画
            CAKeyframeAnimation *shakeAnim = [CAKeyframeAnimation animation];
            shakeAnim.keyPath = @"transform.translation.y";
            shakeAnim.duration = 0.15;
            CGFloat delta = 10;
            shakeAnim.values = @[@0, @(-delta), @(delta), @0];
            shakeAnim.repeatCount = 1;
            [btn.layer addAnimation:shakeAnim forKey:nil];
        }];
    }
    int closeBtnWidth = 20;
    int closeBtnHeight = closeBtnWidth;
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake((kScreenWidth - closeBtnWidth) / 2, kScreenHeight - closeBtnHeight - 20, closeBtnWidth, closeBtnHeight)];
    [closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:closeBtn];
}

- (void)closeBtnClick:(UIButton *)button{
    for (UIView *view in button.superview.subviews) {
        if ([view isKindOfClass:[YLCategoryBtn class]]) {
            YLCategoryBtn *btn = (YLCategoryBtn *)view;
            //清空偏移量的动画
            CGFloat delayTime = (_btnArray.count - 1 - (btn.tag - 1000)) / 10.0;
            [UIView animateWithDuration:0.25 delay:delayTime options:UIViewAnimationOptionAllowAnimatedContent animations:^{
                //偏移量
                btn.transform = CGAffineTransformTranslate(btn.transform, 0, kScreenHeight);
                
            } completion:nil];
        }
    }
    
    CGFloat delayTime = (_btnArray.count - 1)/10.0;
    [UIView animateWithDuration:0.1 delay:delayTime options:UIViewAnimationOptionTransitionNone animations:^{
        button.superview.frame = CGRectMake(button.superview.frame.origin.x, button.superview.frame.origin.y + kScreenHeight, button.superview.frame.size.width, button.superview.frame.size.height);
    } completion:^(BOOL finished){
        [button.superview removeFromSuperview];
        CYLTabBarController *tabBarController = [self cyl_tabBarController];
        UIViewController *viewController = tabBarController.selectedViewController;
        viewController.tabBarController.tabBar.hidden = NO;
    }];
    
    
}


@end
