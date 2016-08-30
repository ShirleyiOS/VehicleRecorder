//
//  YLNoCameraView.h
//  VehicleRecorder
//
//  Created by 王爽 on 16/8/26.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YLNoCameraViewDelegate <NSObject>

- (void)addCameraBtnClick:(UIButton *)button;

@end

@interface YLNoCameraView : UIView
@property (nonatomic, weak) id <YLNoCameraViewDelegate> delegate;

@end
