//
//  ViewController.m
//  RAlert
//
//  Created by roycms on 2016/10/12.
//  Copyright © 2016年 roycms. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "RAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)bt1:(id)sender {
    RAlertView *alert = [[RAlertView alloc] initWithStyle:SimpleAlert];
    alert.contentText = @"SimpleAlert \nAlertView A pop-up framework, Can be simple and convenient to join your project";
}
- (IBAction)bt2:(id)sender {
    RAlertView *alert = [[RAlertView alloc] initWithStyle:ConfirmAlert];
    alert.theme = Purple1Alert;
    alert.headerTitle = @"ConfirmAlert";
    alert.contentText = @"AlertView A pop-up framework, Can be simple and convenient to join your project";
    alert.confirmButtonText = @"Ok";
    alert.confirmButtonBlock = ^(){
        NSLog(@"Click on the Ok");
    };
}
- (IBAction)bt3:(id)sender {
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
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
