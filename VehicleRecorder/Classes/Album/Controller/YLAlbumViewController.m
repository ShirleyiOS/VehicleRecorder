//
//  YLAlbumViewController.m
//  VehicleRecorder
//
//  Created by ecsage on 16/8/25.
//  Copyright © 2016年 auvi. All rights reserved.
//

#import "YLAlbumViewController.h"

@interface YLAlbumViewController()
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation YLAlbumViewController

- (void)viewDidLoad{
    [super viewDidLoad];
   // self.automaticallyAdjustsScrollViewInsets = NO;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize =CGSizeMake(110, 150);
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    _collectionView.backgroundColor = MyColorFromHex(0xf3f3f3);
    _collectionView.alwaysBounceVertical = YES;
    [self.view addSubview:_collectionView];
    UIImageView *noAlbumImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"no_album"]];
    noAlbumImageView.center = CGPointMake(kScreenWidth / 2, kScreenHeight / 2 - 64);
    [_collectionView addSubview:noAlbumImageView];
}

@end
