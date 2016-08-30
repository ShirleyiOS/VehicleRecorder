//
//  UIImageLoopScrollView.h
//  UIImageLoopScrollView
//
//  Created by mac on 14-7-8.
//  Copyright (c) 2014年 cao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIImageLoopScrollView;

@protocol UIImageLoopScrollViewDelegate <NSObject>

@optional
-(void)imageLoopSelected:(UIImageLoopScrollView *)scrollView selectedIndex:(NSInteger)index;

@end

@interface UIImageLoopScrollView : UIView

@property (nonatomic, strong) NSArray *imageArray; //设置该数组即可
@property (nonatomic, strong, readonly) UIScrollView *scrollView;
@property (nonatomic, assign) id<UIScrollViewDelegate> delegate;
@property (nonatomic, assign) id<UIImageLoopScrollViewDelegate> selDelegate;
@property (nonatomic, assign) NSInteger scrollTime;

//- (void)setScrollTime:(NSInteger)scrollTime;
- (id)initWithImageArray:(CGRect)frame imageArray:(NSArray *)imageArray;
- (id)initWithImagePathArray:(CGRect)frame imagePathArray:(NSArray *)imagePathArray;
- (id)initWithImageURLArray:(CGRect)frame imageURLArray:(NSArray *)imageURLArray;
- (id)initWithImageURLStringArray:(CGRect)frame imageURLStringArray:(NSArray *)imageURLStringArray;

@end
