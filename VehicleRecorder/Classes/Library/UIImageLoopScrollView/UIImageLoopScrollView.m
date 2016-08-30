//
//  UIImageLoopScrollView.m
//  UIImageLoopScrollView
//
//  Created by mac on 14-7-8.
//  Copyright (c) 2014年 cao. All rights reserved.
//

#import "UIImageLoopScrollView.h"
#import "UIImageView+WebCache.h"

#define IMAGEVIEW_TAG_START_ID      (200)

@interface UIImageLoopScrollView ()<UIScrollViewDelegate> {
    NSMutableArray *_imageViewArray;
    UIPageControl *_pageControl;
    NSTimer *_scrollTimer;
    BOOL _isUserHandleFlag;
    NSInteger _timerCount;
}

@end

@implementation UIImageLoopScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _imageViewArray = [[NSMutableArray alloc] init];
    }
    return self;
}


- (id)initWithImageArray:(CGRect)frame imageArray:(NSArray *)imageArray
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageViewArray = [[NSMutableArray alloc] init];
        
        [self setImageArray:imageArray];
    }
    return self;
}

- (id)initWithImagePathArray:(CGRect)frame imagePathArray:(NSArray *)imagePathArray
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageViewArray = [[NSMutableArray alloc] init];
        
        NSMutableArray *imageArray = [NSMutableArray array];
        for (NSString *path in imagePathArray) {
            UIImage *image = [UIImage imageNamed:path];
            [imageArray addObject:image];
        }
        
        [self setImageArray:imageArray];
    }
    return self;
}

- (id)initWithImageURLArray:(CGRect)frame imageURLArray:(NSArray *)imageURLArray
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageViewArray = [[NSMutableArray alloc] init];
        
        [self imageArrayWithURL:imageURLArray];
    }
    return self;
}

- (id)initWithImageURLStringArray:(CGRect)frame imageURLStringArray:(NSArray *)imageURLStringArray
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageViewArray = [[NSMutableArray alloc] init];
        
        NSMutableArray *array = [NSMutableArray array];
        for (NSString *path in imageURLStringArray) {
            NSURL *url = [NSURL URLWithString:path];
            [array addObject:url];
        }
        
        [self imageArrayWithURL:array];
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer*)tap
{
    UIImageView *imageView = (UIImageView *)tap.view;
    
    if (self.selDelegate && [self.selDelegate respondsToSelector:@selector(imageLoopSelected:selectedIndex:)]) {
        NSInteger num = imageView.tag - IMAGEVIEW_TAG_START_ID;
        [self.selDelegate imageLoopSelected:self selectedIndex:num];
    }
}

- (void)imageArrayWithURL:(NSArray *)urlArray
{
    if (urlArray.count > 0) {
        [_scrollView removeFromSuperview];
        _scrollView = nil;
        
        for (UIImageView *view in _imageViewArray) {
            [view removeFromSuperview];
        }
        
        [_pageControl removeFromSuperview];
        _pageControl = nil;
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:_scrollView];
        
        BOOL isInsertFlag = NO;
        NSMutableArray *showImageArray = [[NSMutableArray alloc] initWithArray:urlArray];
        if (urlArray.count > 1) {
            //前后各插入一张图片
            [showImageArray insertObject:urlArray[urlArray.count-1] atIndex:0];
            [showImageArray insertObject:urlArray[0] atIndex:showImageArray.count];
            isInsertFlag = YES;
        }
        
        for (NSInteger i=0; i<showImageArray.count; i++) {
            UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
//            view.contentMode = UIViewContentModeScaleAspectFit;
//            [view sd_setImageWithURL:showImageArray[i]];
            // yan改
            [view sd_setImageWithURL:showImageArray[i] placeholderImage:[UIImage imageNamed:@"image_placeholder_640X280"]];
            view.userInteractionEnabled = YES;
            if (isInsertFlag) {
                if (0 == i) {
                    view.tag = IMAGEVIEW_TAG_START_ID + showImageArray.count - 2;
                } else if ((i+1) == showImageArray.count) {
                    view.tag = IMAGEVIEW_TAG_START_ID;
                } else {
                    view.tag = IMAGEVIEW_TAG_START_ID + i - 1;
                }
            } else {
                view.tag = IMAGEVIEW_TAG_START_ID + i;
            }
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            [view addGestureRecognizer:tap];
            
            [_scrollView addSubview:view];
            [_imageViewArray addObject:view];
        }
        
        _scrollView.contentSize = CGSizeMake(showImageArray.count * self.bounds.size.width, self.bounds.size.height);
        if (urlArray.count > 1) {
            _scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
        } else {
            _scrollView.contentOffset = CGPointZero;
        }
        
      //  float width = 15 * urlArray.count + 8;
        //page control yan改位置
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height - 12);
        _pageControl.bounds = CGRectMake(0, 0, self.frame.size.width, 0);
        _pageControl.numberOfPages = urlArray.count;
        _pageControl.hidesForSinglePage = YES;
        _pageControl.currentPage = 0;
        [_pageControl addTarget:self action:@selector(pageControl:) forControlEvents:UIControlEventValueChanged];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
        [self addSubview:_pageControl];
        
        //scroll view
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
}

-(void)setImageArray:(NSArray *)imageArray
{
    if (_imageArray != imageArray) {
        _imageArray = nil;
        _imageArray = imageArray;

        [_scrollView removeFromSuperview];
        _scrollView = nil;
        
        for (UIImageView *view in _imageViewArray) {
            [view removeFromSuperview];
        }
        [_imageViewArray removeAllObjects];
        
        [_pageControl removeFromSuperview];
        _pageControl = nil;
        
        if (imageArray.count > 0) {
            _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
            [self addSubview:_scrollView];

            NSMutableArray *showImageArray = [[NSMutableArray alloc] initWithArray:imageArray];
            BOOL isInsertFlag = NO;
            if (imageArray.count > 1) {
                //前后各插入一张图片
                [showImageArray insertObject:imageArray[imageArray.count-1] atIndex:0];
                [showImageArray insertObject:imageArray[0] atIndex:showImageArray.count];
                isInsertFlag = YES;
            }
            
            for (NSInteger i=0; i<showImageArray.count; i++) {
                UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
                view.image = showImageArray[i];
                view.userInteractionEnabled = YES;
                if (isInsertFlag) {
                    if (0 == i) {
                        view.tag = IMAGEVIEW_TAG_START_ID + showImageArray.count - 2;
                    } else if ((i+1) == showImageArray.count) {
                        view.tag = IMAGEVIEW_TAG_START_ID;
                    } else {
                        view.tag = IMAGEVIEW_TAG_START_ID + i - 1;
                    }
                } else {
                    view.tag = IMAGEVIEW_TAG_START_ID + i;
                }
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
                [view addGestureRecognizer:tap];
                
                [_scrollView addSubview:view];
                [_imageViewArray addObject:view];
            }
            
            _scrollView.contentSize = CGSizeMake(showImageArray.count * self.bounds.size.width, self.bounds.size.height);
            if (imageArray.count > 1) {
                _scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
            } else {
                _scrollView.contentOffset = CGPointZero;
            }

            //page control
            _pageControl = [[UIPageControl alloc] init];
            _pageControl.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height - 12);
            _pageControl.bounds = CGRectMake(0, 0, self.frame.size.width, 0);
            _pageControl.numberOfPages = imageArray.count;
            _pageControl.hidesForSinglePage = YES;
            _pageControl.currentPage = 0;
            [_pageControl addTarget:self action:@selector(pageControl:) forControlEvents:UIControlEventValueChanged];
            _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
            _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
            [self addSubview:_pageControl];
            
            //scroll view
            _scrollView.bounces = NO;
            _scrollView.pagingEnabled = YES;
            _scrollView.showsHorizontalScrollIndicator = NO;
            _scrollView.showsVerticalScrollIndicator = NO;
            _scrollView.delegate = self;
        }
    }
}

#pragma mark - pageControl
- (void)pageControl:(UIPageControl *)ctl
{
    [_scrollView setContentOffset:CGPointMake(ctl.numberOfPages * self.bounds.size.width, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = 0;
    CGFloat x=0;
    
    if (_scrollView.contentOffset.x <= 0) {
        page = _pageControl.numberOfPages - 1;
        x = _scrollView.contentSize.width - self.bounds.size.width * 2;
        _scrollView.contentOffset = CGPointMake(x, 0);
    } else if (_scrollView.contentOffset.x >= (_scrollView.contentSize.width - self.bounds.size.width)) {
        page = 0;
        _scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
    } else if (_scrollView.contentOffset.x >= self.bounds.size.width) {
        page = (_scrollView.contentOffset.x - self.bounds.size.width) / self.bounds.size.width;
    }

    _pageControl.currentPage = page;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)]) {
        [self.delegate scrollViewDidEndDecelerating:scrollView];
    }
    
    _isUserHandleFlag = NO;
    _timerCount = 0;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _isUserHandleFlag = YES;
    _timerCount = 0;
}

// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
}

-(void)setScrollTime:(NSInteger)scrollTime
{
    if (_scrollTime != scrollTime) {
        _scrollTime = scrollTime;
        
        _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:scrollTime target:self selector:@selector(scrollTimerHandle:) userInfo:nil repeats:YES];
    }
}

-(void)scrollTimerHandle:(NSTimer *)timer
{
   // NSLog(@"%@",[NSDate date]);
    if (!_isUserHandleFlag) {
        _timerCount++;
        //if (_timerCount >= 3) {
            CGFloat w = _scrollView.contentOffset.x + self.bounds.size.width;
            if (w < _scrollView.contentSize.width) {
                [_scrollView setContentOffset:CGPointMake(w, 0) animated:YES];
            }
      //  }
    } else {
        _timerCount = 0;
    }
}

- (void)dealloc
{
    for (UIImageView *imageView in _imageArray) {
        [imageView sd_cancelCurrentImageLoad];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
