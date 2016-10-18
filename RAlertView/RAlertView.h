//
//  RAlertView.h
//  RAlert
//
//  Created by roycms on 2016/10/11.
//  Copyright © 2016年 roycms. All rights reserved.
//

#define RGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import <UIKit/UIKit.h>
#import "Masonry.h"
typedef NS_ENUM(NSInteger,AlertStyle) {
    SimpleAlert = 0,
    ConfirmAlert,
    CancelAndConfirmAlert,
};
typedef NS_ENUM(NSInteger,AlertTheme) {
    YellowAlert = 0,
    GreenAlert,
    BlueAlert,
    Purple1Alert,
    Purple2Alert,
};

@interface RAlertView : UIView
- (instancetype)initWithStyle:(AlertStyle)style;
- (instancetype)initWithStyle:(AlertStyle)style width:(CGFloat)width;
- (void)exit;
@property (nonatomic, copy) void(^confirmButtonBlock)();
@property (nonatomic, copy) void(^cancelWindowBlock)();
@property (nonatomic,assign)AlertTheme theme;
@property (nonatomic,strong)NSString *headerTitle;
@property (nonatomic,strong)NSString *contentText;
-(void)setContentText:(NSString *)contentText isAlignmentCenter:(BOOL)isAlignmentCenter;
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,strong)NSString *confirmButtonText;
@property (nonatomic,strong)NSString *cancelButtonText;
@property (nonatomic,assign)BOOL isClickBackgroundCloseWindow;
@end
