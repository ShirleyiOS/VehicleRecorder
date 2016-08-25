//
//  UIImage+XY.h
//  MaoYan
//
//  Created by yan on 15/5/13.
//  Copyright (c) 2015年 jinaiwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XY)

/**
 *  从图片中点开始拉伸
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;

/**
 *  从制定位置开始拉伸图片
 *
 *  @param name   图片名字
 *  @param scaleW x
 *  @param scaleH y
 *
 *  @return 拉伸后的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name scaleW:(CGFloat)scaleW scaleH:(CGFloat)scaleH;

/**
 *  根据指定颜色生成指定大小的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  对画布裁剪成圆形,然后再将原始图像画出来
 *
 *  @param imageName 图片名
 *  @param inset     偏移量 建议为0，使用默认大小
 */
+ (UIImage *)imageCircle:(NSString*)imageName withParam:(CGFloat)inset;

/**
 *  对画布裁剪成圆形,然后再将原始图像画出来
 *
 *  @param imageName    图片名
 *  @param inset        偏移量 建议为0，使用默认大小
 *  @param contextWdith 边框宽度
 *  @param contextColor 边框颜色
 */
+ (UIImage *)imageCircle:(NSString*)imageName withParam:(CGFloat)inset contextWidth:(CGFloat)contextWdith contextColor:(UIColor*)contextColor;

+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

@end
