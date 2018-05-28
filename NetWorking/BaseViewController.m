//
//  BaseViewController.m
//  NetWorking
//
//  Created by 耿荣林 on 2018/5/22.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
}

- (instancetype)init{
    if (self == [super init]) {
        _dao = [[RLBaseDao alloc]init];
    }
    return self;
}

- (void)showAlterViewWithTitle:(NSString *)title withmessage:(NSString *)message withCancelBtnTitle:(NSString *)cancelTitle withSureBtnTitle:(NSString *)sureTitle{
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
