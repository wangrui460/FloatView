# FloatView
浮动图片  

![image](https://github.com/wangrui460/FloatView/raw/master/screenshots/FloatView.gif)

### 使用方式
<pre><code>
创建方式一：
FloatView* floatView = [[FloatView alloc] initWithImage:[UIImage imageNamed:@"FloatBonus"]];
创建方式二：
FloatView* floatView = [FloatView new];
[floatView setImageWithName:@"FloatBonus"];

floatView.stayAlpha = 0.3;
floatView.stayMode = STAYMODE_RIGHT;
[floatView setTapActionWithBlock:^{
    NSLog(@"跳转到邀请好友界面");
}];
[self.view addSubview:floatView];
</code></pre>


你觉得对你有所帮助的话，请献上宝贵的Star！！！ 不胜感激！！！
