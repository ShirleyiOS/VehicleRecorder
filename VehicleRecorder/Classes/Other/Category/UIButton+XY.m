//
//  UIButton+XY.m
//  JinAiWang
//
//  Created by yan on 15/3/26.
//  Copyright (c) 2015年 Jinaiwang. All rights reserved.
//

#import "UIButton+XY.h"

@implementation UIButton (XY)

+ (UIButton *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normalImg = [UIImage imageNamed:icon];
    UIImage *highlightedImg = [UIImage imageNamed:highIcon];
    [button setBackgroundImage:normalImg forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedImg forState:UIControlStateHighlighted];
    [button setBackgroundImage:highlightedImg forState:UIControlStateDisabled];
    button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)setImageName:(NSString *)imageName forState:(UIControlState)state
{
    if (imageName == nil) {
        return;
    }
    UIImage *img = [UIImage imageNamed:imageName];
    [self setImage:img forState:state];
}

- (void)setBackgroundImageName:(NSString *)imageName forState:(UIControlState)state
{
    if (imageName == nil) {
        return;
    }
    UIImage *img = [UIImage imageNamed:imageName];
    [self setBackgroundImage:img forState:state];
}

- (void)setButtonImageNameForNormal:(NSString *)normal imageNameForHighlighted:(NSString *)highlighted
{
    [self setButtonImageNameForNormal:normal imageNameForHighlighted:highlighted imageNameForSelected:nil imageNameForDisabled:nil];
}

- (void)setButtonImageNameForNormal:(NSString *)normal imageNameForHighlighted:(NSString *)highlighted imageNameForSelected:(NSString *)selected
{
    [self setButtonImageNameForNormal:normal imageNameForHighlighted:highlighted imageNameForSelected:selected imageNameForDisabled:nil];
}

- (void)setButtonImageNameForNormal:(NSString *)normal imageNameForHighlighted:(NSString *)highlighted imageNameForSelected:(NSString *)selected imageNameForDisabled:(NSString *)disabled
{
    [self setImageName:normal forState:UIControlStateNormal];
    [self setImageName:highlighted forState:UIControlStateHighlighted];
    [self setImageName:selected forState:UIControlStateSelected];
    [self setImageName:disabled forState:UIControlStateDisabled];
}

- (void)buttonTitleAndImageEdgeInsetsExchange:(CGFloat)margin {
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.imageView.image.size.width-margin, 0, self.imageView.image.size.width+margin)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.bounds.size.width+margin, 0, -self.titleLabel.bounds.size.width-margin)];
}

/**
 *  点赞动画
 */
- (void)commendAnimation
{
    CAKeyframeAnimation *clickAnima = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    clickAnima.values = @[@(0.1),@(1.0),@(1.5)];
    clickAnima.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    clickAnima.calculationMode = kCAAnimationLinear;
    [self.layer addAnimation:clickAnima forKey:@"commendAnimation"];
}

@end
