//
//  UIButton+XY.h
//  JinAiWang
//
//  Created by yan on 15/3/26.
//  Copyright (c) 2015年 Jinaiwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XY)

+ (UIButton *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;

- (void)setImageName:(NSString *)imageName forState:(UIControlState)state;
- (void)setBackgroundImageName:(NSString *)imageName forState:(UIControlState)state;
- (void)setButtonImageNameForNormal:(NSString *)normal imageNameForHighlighted:(NSString *)highlighted;
- (void)setButtonImageNameForNormal:(NSString *)normal imageNameForHighlighted:(NSString *)highlighted imageNameForSelected:(NSString *)selected;
- (void)setButtonImageNameForNormal:(NSString *)normal imageNameForHighlighted:(NSString *)highlighted imageNameForSelected:(NSString *)selected imageNameForDisabled:(NSString *)disabled;

// 让button的title和image左右交换位置
- (void)buttonTitleAndImageEdgeInsetsExchange:(CGFloat)margin;

/**
 *  点赞动画
 */
- (void)commendAnimation;

@end
