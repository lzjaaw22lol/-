//
//  ZJPicChangeView.m
//  图片轮播
//
//  Created by qf on 15-3-15.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "ZJPicChangeView.h"
#import "UIImageView+WebCache.h"
#define scrollW self.frame.size.width
#define scrollH self.frame.size.height
@interface ZJPicChangeView()<UIScrollViewDelegate>
{
    UIPageControl *pageC;
    NSTimer *timer;
    float slideTime;
}
@end
@implementation ZJPicChangeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.delegate = self;
        slideTime = 2;
    }
    return self;
}
-(void)addPic:(NSArray *)picView isAddPc:(BOOL)iap and:(UIView *)fv{
    self.contentSize = CGSizeMake(scrollW * (picView.count+1), scrollH);
    if([picView[0] isKindOfClass:[NSURL class]]){
    
    }
    else
    {
        int i;
        for(i=0;i<picView.count;i++){
            UIImageView *p = [[UIImageView alloc] initWithFrame:CGRectMake(scrollW*i, 0, scrollW, scrollH)];
            p.image = [UIImage imageNamed:picView[i]];
            [self addSubview:p];
        }
        UIImageView *p = [[UIImageView alloc] initWithFrame:CGRectMake(scrollW*i, 0, scrollW, scrollH)];
        p.image = [UIImage imageNamed:picView[0]];
        [self addSubview:p];
    }
//    int i=0;
//    UIImageView *lastPicView = [[UIImageView alloc] init];
//    for(UIImageView *iv in picView){
//        if(i==0){
//            NSData *data = UIImageJPEGRepresentation(iv.image, 0.75);
//            lastPicView.image = [UIImage imageWithData:data];
//        }
//        iv.frame = CGRectMake(scrollW * i, 0, scrollW, scrollH);
//        [self addSubview:iv];
//        i++;
//    }
//    lastPicView.frame = CGRectMake(scrollW * i, 0, scrollW, scrollH);
    [fv addSubview:self];
    if(iap){
        UIView *pagebg = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.size.height, self.frame.size.width, 20)];
        pagebg.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [fv addSubview:pagebg];
        pageC = [[UIPageControl alloc] init];
        pageC.frame = CGRectMake(0, 0, 200, 20);
        pageC.center = CGPointMake(scrollW/2, 10);
        pageC.numberOfPages = picView.count;
        pageC.currentPage = 0;
        [pagebg addSubview:pageC];
    }
    [self addTimer];
}
- (void)nextImage
{
    int nextWhich = pageC.currentPage+1;
    if(pageC.currentPage == 0){
        self.contentOffset = CGPointMake(0, 0);
    }
    if(nextWhich == pageC.numberOfPages){
        pageC.currentPage = 0;
        CGFloat x = nextWhich * scrollW;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:slideTime/2];
        self.contentOffset = CGPointMake(x, 0);
        [UIView commitAnimations];
        return;
    }
    pageC.currentPage = nextWhich;
    CGFloat x = nextWhich * scrollW;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:slideTime/2];
    self.contentOffset = CGPointMake(x, 0);
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int which = scrollView.contentOffset.x/scrollW;
    pageC.currentPage = which;
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}
- (void)addTimer{
    timer = [NSTimer scheduledTimerWithTimeInterval:slideTime target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}
- (void)removeTimer
{
    [timer invalidate];
}

@end
