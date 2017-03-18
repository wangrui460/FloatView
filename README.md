# FloatView
浮动图片

# 使用方式
FloatView* floatView = [FloatView new];
floatView.stayAlpha = 0.3;
floatView.stayMode = STAYMODE_RIGHT;
[floatView setTapActionWithBlock:^{
NSLog(@"跳转到邀请好友界面");
}];
[self.view addSubview:floatView];
