//
//  ViewController.m
//  图片轮播
//
//  Created by qf on 15-3-15.
//  Copyright (c) 2015年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "ZJPicChangeView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *arr = [NSArray arrayWithObjects:@"girl0.png",@"girl1.png",@"girl2.png", nil];
    NSMutableArray *res1 = [[NSMutableArray alloc] init];
    for(int i=0;i<3;i++){
        UIImageView *p = [[UIImageView alloc] init];
        
        p.image = [UIImage imageNamed:arr[i]];
        [res1 addObject:p];
    }
    UIImageView *p1 = res1[1];
    
    NSLog(@"33%@",p1.image);
    ZJPicChangeView *zcv = [[ZJPicChangeView alloc] initWithFrame:CGRectMake(0, 20, 320, 300)];
    [zcv addPic:arr isAddPc:YES and:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
