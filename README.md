# XMVerificationCodeInputView

[![Version](https://img.shields.io/cocoapods/v/XMVerificationCodeInputView.svg?style=flat)](https://cocoapods.org/pods/XMVerificationCodeInputView)
[![Platform](https://img.shields.io/cocoapods/p/XMVerificationCodeInputView.svg?style=flat)](https://cocoapods.org/pods/XMVerificationCodeInputView)

## Example

<img src="https://i.loli.net/2020/12/26/PEcijMIQ8zZK1gR.png" width="185" height="400">

## Use
    
    一个简单验证码输入框 可以自定义颜色 字体等 支持自动布局
    现默认有两种type 一种是下划线 一种是矩形 
    可以自定义输入框样式 需继承于XMBaseInputBox 具体参考Example里的XMRhombusInputBox类

    //下划线类型
    XMVerificationCodeInputView *underLineView = [[XMVerificationCodeInputView alloc] initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width-100, 50)];
    //输入框个数 默认为4
    underLineView.textCount = 6;
    underLineView.boxType = XMVerificationCodeInputViewUnderline;
    [self.view addSubview:underLineView];
    underLineView.textDidInputComplete = ^(NSString * _Nonnull text) {
        [weakself showAlertWithText:text];
    } ;
    
    //矩形带边框类型
    XMVerificationCodeInputView *retangleInputView = [[XMVerificationCodeInputView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(underLineView.frame)+50, self.view.bounds.size.width-100, 40)];
    retangleInputView.textCount = 5;
    retangleInputView.boxType = XMVerificationCodeInputViewRetangle;
    [self.view addSubview:retangleInputView];
    retangleInputView.textDidInputComplete = ^(NSString * _Nonnull text) {
        [weakself showAlertWithText:text];
    } ;
    
    //自定义类型
    XMVerificationCodeInputView *customInputView = [[XMVerificationCodeInputView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(squareInputView.frame)+50, self.view.bounds.size.width-100, 50)];
    customInputView.boxType = XMVerificationCodeInputViewCustom;
    customInputView.customInputBox = [XMRhombusInputBox class];
    [self.view addSubview:customInputView];
    customInputView.textDidInputComplete = ^(NSString * _Nonnull text) {
        [weakself showAlertWithText:text];
    } ;


## Installation

XMVerificationCodeInputView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XMVerificationCodeInputView'
```

## Author

liming789456@qq.com

## License

XMVerificationCodeInputView is available under the MIT license. See the LICENSE file for more info.
