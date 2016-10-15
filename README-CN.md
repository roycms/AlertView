 ![Logo](https://github.com/roycms/RAlertView/blob/master/RAlert/logo.png)
 RAlertView ios弹窗
===
AlertView 是一个ios弹窗框架，可以很简单的集成到自己的项目内，支持pod.

[![Shippable](https://img.shields.io/shippable/5444c5ecb904a4b21567b0ff.svg?maxAge=2592000?style=flat-square)](https://github.com/roycms/RAlertView)
[![CocoaPods](https://img.shields.io/badge/pod-0.0.1-red.svg)](http://cocoapods.org/?q=RAlertView)
[![Packagist](https://img.shields.io/packagist/l/doctrine/orm.svg?maxAge=2592000?style=flat-square)](https://github.com/roycms/RAlertView/blob/master/LICENSE)
[![email](https://img.shields.io/badge/%20email%20-%20roycms%40qq.com%20-yellowgreen.svg)](mailto:roycms@qq.com)


## 安装
- 依赖 ` Masonry ` 和 ` HexColors ` 框架，如果项目为引入请导入这两个框架通过pod安装则自动下载依赖
- 在需要的地方导入：`#import "RAlertView.h"`

## cocoapods 安装
`  pod 'AlertView' `

## 弹窗类型  AlertStyle
```objective-c
typedef NS_ENUM(NSInteger,AlertStyle) {
    SimpleAlert = 0,
    ConfirmAlert,
    CancelAndConfirmAlert,
};
```
![RAlertView Preview](https://github.com/roycms/RAlertView/blob/master/RAlert/AlertStyle.jpg)
## 弹窗主题效果  AlertTheme
```objective-c
typedef NS_ENUM(NSInteger,AlertTheme) {
    YellowAlert = 0,
    GreenAlert,
    BlueAlert,
    Purple1Alert,
    Purple2Alert,
};
```
![RAlertView Preview](https://github.com/roycms/RAlertView/blob/master/RAlert/Theme.jpg)

## 一些属性设置
* 设置单击背景或者任意位置都可以关闭弹窗
```objective-c
alert.isClickBackgroundCloseWindow = YES;
```
* 设置弹窗内容的文字的对齐是否居中
```objective-c
[alert setContentText:@"is ContentText" isAlignmentCenter:YES];
```

## 初始化弹窗  RAlertView
* 按照样式初始化 initWithStyle AlertStyle
```objective-c
RAlertView *alert = [[RAlertView alloc] initWithStyle:SimpleAlert];
```
* 按照样式和宽度初始化  width的值可以设置0-1表示小对于屏幕宽度的百分比，如果大于1的值则按照px像素处理 initWithStyle AlertStyle and width
```objective-c
RAlertView *alert = [[RAlertView alloc] initWithStyle:SimpleAlert width:0.8];
```
## SimpleAlert
```objective-c
RAlertView *alert = [[RAlertView alloc] initWithStyle:SimpleAlert];
alert.contentText = @"SimpleAlert \nAlertView A pop-up framework, Can be simple and convenient to join your project";
```
## ConfirmAlert
```objective-c
RAlertView *alert = [[RAlertView alloc] initWithStyle:ConfirmAlert];
alert.theme = Purple1Alert;
alert.headerTitle = @"ConfirmAlert";
alert.contentText = @"AlertView A pop-up framework, Can be simple and convenient to join your project";
alert.confirmButtonText = @"Ok";
alert.confirmButtonBlock = ^(){
    NSLog(@"Click on the Ok");
};
```
## CancelAndConfirmAlert
```objective-c
RAlertView *alert = [[RAlertView alloc] initWithStyle:CancelAndConfirmAlert];
alert.headerTitle = @"CancelAndConfirmAlert";
alert.contentText = @"AlertView A pop-up framework, Can be simple and convenient to join your project";
alert.confirmButtonText = @"Ok";
alert.cancelButtonText = @"Cancel";
alert.confirmButtonBlock = ^(){
    NSLog(@"Click on the Ok");
};
alert.cancelWindowBlock = ^(){
    NSLog(@"Click on the Cancel");
};
```
## 期待
* 如果在使用过程中遇到BUG，希望你能Issues我，谢谢（或者尝试下载最新的框架代码看看BUG修复没有）
* 如果在使用过程中发现功能不够用，希望你能Issues我，我非常想为这个框架增加更多好用的功能，谢谢
* 如果你想为RAlertView输出代码，请拼命Pull Requests我