//
//  ViewController.m
//  NetWorking
//
//  Created by 耿荣林 on 2018/5/21.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "ViewController.h"
#import "RLBaseDao+login.h"
#import "RLBaseDao+FirstPage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RLBaseDao *dao = [[RLBaseDao alloc]init];
    [dao getidCodeWithPhoneNumber:@"18840839630"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getIdCode:) name:@"getcodederror" object:nil];
}

- (void)getIdCode:(NSNotification *)notifiction{
    NSLog(@"-----------%@",notifiction.userInfo);
    //使用基类提示网络状态：
    if (true) {
        [self showAlterViewWithTitle:@"dfdf" withmessage:@"dfdsfsdfdsf" withCancelBtnTitle:@"" withSureBtnTitle:@""];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
