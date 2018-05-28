//
//  RLBaseDao+login.h
//  NetWorking
//
//  Created by 耿荣林 on 2018/5/22.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "RLBaseDao.h"

@interface RLBaseDao (login)
- (void)getidCodeWithPhoneNumber:(NSString *)number;
- (void)registerCodeWithPhoneNumber:(NSString *)number withPassWord:(NSString *)psw withidCode:(NSString *)idCode;
- (void)loginCodeWithPhoneNumber:(NSString *)number withPassWord:(NSString *)psw;
- (void)forgotWithPhoneNumber:(NSString *)number withPassWord:(NSString *)psw withidCode:(NSString *)idCode;
@end
