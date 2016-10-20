//
//  RAlertView.h
//  RAlert
//
//  Created by roycms on 2016/10/11.
//  Copyright © 2016年 roycms. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "RRGB.h"
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
