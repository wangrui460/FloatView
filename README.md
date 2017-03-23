# FloatView
浮动图片

### 使用方式
<pre><code>
创建方式一：
FloatView* floatView = [[FloatView alloc] initWithImage:[UIImage imageNamed:@"FloatBonus"]];
创建方式二：
FloatView* floatView = [FloatView new];
[floatView setImageWithName:@"FloatBonus"];
FloatView* floatView = [FloatView new];
floatView.stayAlpha = 0.3;
floatView.stayMode = STAYMODE_RIGHT;
[floatView setTapActionWithBlock:^{
    NSLog(@"跳转到邀请好友界面");
}];
[self.view addSubview:floatView];
</code></pre>
