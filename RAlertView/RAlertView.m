//
//  RAlertView.m
//  RAlert
//
//  Created by roycms on 2016/10/11.
//  Copyright © 2016年 roycms. All rights reserved.
//

#import "RAlertView.h"

@interface RAlertView ()
@property(nonatomic,strong)UILabel *headerTitleLabel;
@property(nonatomic,strong)UILabel *contentTextLabel;
@property(nonatomic,strong)UIButton *closedButton;
@property(nonatomic,strong)UIButton *confirmButton;
@property(nonatomic,strong)UIButton *cancelButton;
@property(nonatomic,strong)UIView *mainView;
@end
@implementation RAlertView

- (instancetype)initWithStyle:(AlertStyle)style {
    self = [super init];
    if (self) {
        [self initWindow:style];
    }
    return self;
}

-(void)setTheme:(AlertTheme)theme{

    switch (theme) {
        case YellowAlert://#fddb43
            [_confirmButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#fddb43"]];
            [_confirmButton setTitleColor:[UIColor hx_colorWithHexRGBAString:@"#3d3d3d"] forState:UIControlStateNormal];
            break;
        case GreenAlert://#4CBE77
            [_confirmButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#4CBE77"]];
            [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case BlueAlert://#295DC0
            [_confirmButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#295DC0"]];
            [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case Purple1Alert://#74225C
            [_confirmButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#74225C"]];
            [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        case Purple2Alert://#B655FF
            [_confirmButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#B655FF"]];
            [_confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

            break;
    }
}

-(void)setHeaderTitle:(NSString *)headerTitle{
    [self.headerTitleLabel setText:headerTitle];
}
-(void)setContentText:(NSString *)contentText{
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:contentText];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [contentText length])];
    [self.contentTextLabel setAttributedText:attributedString];
}
-(void)setConfirmButtonText:(NSString *)confirmButtonText{
    [self.confirmButton setTitle:confirmButtonText forState:UIControlStateNormal];
}
-(void)setCancelButtonText:(NSString *)cancelButtonText{
    [self.cancelButton setTitle:cancelButtonText forState:UIControlStateNormal];
}

-(void)initWindow:(AlertStyle)style {
    
    switch (style) {
        case SimpleAlert:
            [self viewInitUI];
            [self simpleAlertViewInitUI];
            [self animate];
            break;
        case ConfirmAlert:
            [self viewInitUI];
            [self confirmAlertViewInitUI];
            [self animate];
            break;
        case CancelAndConfirmAlert:
            [self viewInitUI];
            [self cancelAndConfirmAlertViewInitUI];
            [self animate];
            break;
    }
}

-(void)viewInitUI{
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    [window addSubview:self];
    [self addSubview:self.mainView];
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    [self.mainView insertSubview:self.closedButton atIndex:999];
    [self.mainView addSubview:self.headerTitleLabel];
    [self.mainView insertSubview:self.contentView atIndex:0];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(window);
    }];
    
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(self.mas_width).multipliedBy(0.7);
    }];
    [self.closedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainView);
        make.right.equalTo(self.mainView);
        make.width.height.offset(35);
    }];
    [self.headerTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainView).offset(10);
        make.left.equalTo(self.mainView).offset(15);
        make.right.equalTo(self.mainView).offset(-30);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerTitleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.headerTitleLabel);
        make.right.equalTo(self.mainView).offset(-15);
        make.bottom.equalTo(self.mainView).offset(-10);
    }];
}

-(void)simpleAlertViewInitUI{
    
    [self.contentTextLabel setFont:[UIFont systemFontOfSize:15]];
    [self.contentView addSubview:self.contentTextLabel];
    [self.contentTextLabel sizeToFit];

    [self.contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}

-(void)confirmAlertViewInitUI{
    
    [self.mainView addSubview:self.confirmButton];
    [self.contentView addSubview:self.contentTextLabel];

    [self.contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
    }];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentTextLabel.mas_bottom).offset(10);
        make.left.right.equalTo(self.mainView);
        make.bottom.equalTo(self.mainView);
        make.height.offset(40);
    }];
}

-(void)cancelAndConfirmAlertViewInitUI{
    [self.mainView addSubview:self.cancelButton];
    [self.mainView addSubview:self.confirmButton];
    [self.contentView addSubview:self.contentTextLabel];
    
    [self.contentTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
    }];
    
    NSMutableArray *arrayM = @[].mutableCopy;
    [arrayM addObject:self.cancelButton];
    [arrayM addObject:self.confirmButton];
    
    [arrayM mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [arrayM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.bottom.equalTo(self.mainView);
        make.top.equalTo(self.contentTextLabel.mas_bottom).offset(10);
    }];
}

-(void)animate{
    
   [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    [UIView animateWithDuration:0.12 animations:^{
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    }];
    
    self.mainView.transform = CGAffineTransformMakeTranslation(0, 600);
    [UIView animateWithDuration:0.12 animations:^{
        self.mainView.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}

-(void)exit{
    [self removeFromSuperview];
}

-(void)closedButtonClick:(UIButton *)sender{
    [self exit];
}
-(void)confirmButtonClick:(UIButton*)sender{
    
    if(self.confirmButtonBlock){
        self.confirmButtonBlock();
    }
    [self exit];
}
-(void)cancelButtonClick:(UIButton*)sender{
    if(self.cancelWindowBlock){
        self.cancelWindowBlock();
    }
    [self exit];
}

-(UIView*)mainView{
    if (_mainView == nil) {
        _mainView = [[UIView alloc]init];
        [_mainView setBackgroundColor:[UIColor whiteColor]];
        [_mainView.layer setMasksToBounds:YES];
        [_mainView.layer setCornerRadius:4];
    }
    return _mainView;
}
-(UIButton *)confirmButton{
    if(_confirmButton == nil){
        _confirmButton = [[UIButton alloc]init];
        [_confirmButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#fddb43"]];
        [_confirmButton setTitle:@"Ok" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor hx_colorWithHexRGBAString:@"#3d3d3d"] forState:UIControlStateNormal];
        [_confirmButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_confirmButton addTarget:self action:@selector(confirmButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}
-(UIButton *)cancelButton{
    if(_cancelButton == nil){
        _cancelButton = [[UIButton alloc]init];
        [_cancelButton setBackgroundColor:[UIColor hx_colorWithHexRGBAString:@"#EBECED"]];
        [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor hx_colorWithHexRGBAString:@"#3d3d3d"] forState:UIControlStateNormal];
        [_cancelButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

-(UIButton *)closedButton{
    if(_closedButton == nil){
        _closedButton = [[UIButton alloc]init];
        [_closedButton setImage:[UIImage imageNamed:@"closed.png"] forState:UIControlStateNormal];
        [_closedButton addTarget:self action:@selector(closedButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closedButton;
}

-(UILabel*)headerTitleLabel {
    if (_headerTitleLabel == nil) {
        _headerTitleLabel = [[UILabel alloc]init];
        [_headerTitleLabel setFont:[UIFont systemFontOfSize:15]];
        [_headerTitleLabel setTextAlignment:NSTextAlignmentCenter];
        [_headerTitleLabel setTextColor:[UIColor hx_colorWithHexRGBAString:@"#3d3d3d"]];
    }
    return _headerTitleLabel;
}

-(UIView *)contentView{
    if(_contentView==nil){
        _contentView =[[UIView alloc]init];
        [_contentView setBackgroundColor:[UIColor whiteColor]];
    }
    return _contentView;
}

-(UILabel*)contentTextLabel {
    if (_contentTextLabel == nil) {
        _contentTextLabel = [[UILabel alloc]init];
        [_contentTextLabel setFont:[UIFont systemFontOfSize:13]];
        [_contentTextLabel setTextColor:[UIColor hx_colorWithHexRGBAString:@"#898989"]];
        _contentTextLabel.numberOfLines = 0;
    }
    return _contentTextLabel;
}

@end
