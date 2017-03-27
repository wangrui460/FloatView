//
//  ViewController.m
//  FloatView
//
//  Created by wangrui on 2017/3/16.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "ViewController.h"
#import "FloatView.h"

@interface ViewController () <UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) FloatView* floatView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
//    self.floatView = [[FloatView alloc] initWithImage:[UIImage imageNamed:@"FloatBonus"]];
    self.floatView = [FloatView new];
    [self.floatView setImageWithName:@"FloatBonus"];
    self.floatView.stayAlpha = 0.3;
    self.floatView.stayMode = STAYMODE_LEFTANDRIGHT;
    [self.floatView setTapActionWithBlock:^{
        NSLog(@"跳转到邀请好友界面");
    }];
    [self.view addSubview:self.floatView];
//    [self.view bringSubviewToFront:self.floatView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.floatView moveTohalfInScreenWhenScrolling];
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
    }
    return _tableView;
}

@end
