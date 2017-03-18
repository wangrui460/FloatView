//
//  ViewController.m
//  FloatView
//
//  Created by wangrui on 2017/3/16.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "ViewController.h"
#import "FloatView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FloatView* floatView = [FloatView new];
    floatView.stayAlpha = 0.3;
    floatView.stayMode = STAYMODE_RIGHT;
    [floatView setTapActionWithBlock:^{
        NSLog(@"跳转到邀请好友界面");
    }];
    [self.view addSubview:floatView];
}


@end
