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
    UIImageView *noAlbumImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"no_album"]];
    noAlbumImageView.center = self.view.center;
    [self.view addSubview:noAlbumImageView];
}

@end
