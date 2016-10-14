 ![Logo](https://github.com/roycms/RAlertView/blob/master/RAlert/log.png)
 RAlertView
===
AlertView A pop-up framework, Can be simple and convenient to join your project.

## Installation
- Depend on the project ` Masonry `and ` HexColors ` Import  `#import "Masonry.h"` `#import "HexColors.h"`
- Import the main header file：`#import "RAlertView.h"`

## Preview  AlertStyle
```objective-c
typedef NS_ENUM(NSInteger,AlertStyle) {
    SimpleAlert = 0,
    ConfirmAlert,
    CancelAndConfirmAlert,
};
```
![RAlertView Preview](https://github.com/roycms/RAlertView/blob/master/RAlert/AlertStyle.jpg)
## Preview  AlertTheme
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
