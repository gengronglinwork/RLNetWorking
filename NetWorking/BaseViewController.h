//
//  BaseViewController.h
//  NetWorking
//
//  Created by 耿荣林 on 2018/5/22.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RLBaseDao.h"

@interface BaseViewController : UIViewController
@property (nonatomic,strong) RLBaseDao *dao;
- (void)showAlterViewWithTitle:(NSString *)title withmessage:(NSString *)message withCancelBtnTitle:(NSString *)cancelTitle withSureBtnTitle:(NSString *)sureTitle;
@end
