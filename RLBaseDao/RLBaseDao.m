//
//  RLBaseDao.m
//  NetWorking
//
//  Created by 耿荣林 on 2018/5/22.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "RLBaseDao.h"

@implementation RLBaseDao

- (void)dealloc{
    [_netHelper cancelRequest];
}

@end
