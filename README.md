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


### 联系我
扫码回复1获取面试资料（持续更新）
![](https://user-images.githubusercontent.com/11909313/123933944-6a4abe00-d9c5-11eb-83ca-379313a2af7c.png)
