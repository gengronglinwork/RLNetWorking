//
//  RLBaseDao+login.m
//  NetWorking
//
//  Created by 耿荣林 on 2018/5/22.
//  Copyright © 2018年 耿荣林. All rights reserved.
//
#import "RLBaseDao+login.h"

@implementation RLBaseDao (login)
- (void)getidCodeWithPhoneNumber:(NSString *)number{
    RlnetHelper *helper = [[RlnetHelper alloc]init];
    NSDictionary *dic = [NSDictionary dictionary];
    dic = @{@"phoneNumber":number};
    [helper getRequestWithAPI:@"" withParams:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self notifictionWithResponse:responseObject withType:@"getcodesucess"];
        });
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self notifictionWithResponse:error withType:@"getcodederror"];
    }];
}

- (void)registerCodeWithPhoneNumber:(NSString *)number withPassWord:(NSString *)psw withidCode:(NSString *)idCode{
    RlnetHelper *helper = [[RlnetHelper alloc]init];
    NSDictionary *dic = [NSDictionary dictionary];
    dic = @{@"phoneNumber":number,@"idCode":idCode};
    [helper getRequestWithAPI:@"" withParams:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)loginCodeWithPhoneNumber:(NSString *)number withPassWord:(NSString *)psw{
    NSDictionary *dic = [NSDictionary dictionary];
    dic = @{@"phoneNumber":number,@"password":psw};
    [self.netHelper getRequestWithAPI:@"" withParams:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)forgotWithPhoneNumber:(NSString *)number withPassWord:(NSString *)psw withidCode:(NSString *)idCode{
    NSDictionary *dic = [NSDictionary dictionary];
    dic = @{@"phoneNumber":number,@"password":psw,@"idcode":idCode};
    [self.netHelper getRequestWithAPI:@"" withParams:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
    
    }];
}

- (void)notifictionWithResponse:(id)Response withType:(NSString *)type{
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter postNotificationName:type object:Response];
}

@end
