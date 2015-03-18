//
//  ZJPicChangeView.h
//  图片轮播
//
//  Created by qf on 15-3-15.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJPicChangeView : UIScrollView
//NSUrl数组 是否加pagecontrol 父类
-(void)addPic:(NSArray *)picView isAddPc:(BOOL)iap and:(UIView *)fv;
@end
