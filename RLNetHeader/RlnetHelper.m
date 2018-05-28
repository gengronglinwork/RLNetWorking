//
//  RlnetHelper.m
//  NetWorking
//
//  Created by 耿荣林 on 2018/5/22.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "RlnetHelper.h"
#import "RLSesionManager.h"
NSString *RlnetHelperReponseDomian = @"RlnetHelperReponseDomian";
NSString *RlnetHelperReponseUserDomianKey = @"RlnetHelperReponseUserDomianKey";
@interface RlnetHelper()
@property (nonatomic,strong) NSMutableDictionary<NSString *,NSURLSessionDataTask*> *requestTask;
@end
#define BASE_URL @"http://123.126.40.109:7003/asmr/"

@implementation RlnetHelper
- (instancetype)init{
    if (self = [super init]) {
        _requestTask = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)cancelRequest{
    [_requestTask enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSURLSessionDataTask * _Nonnull obj, BOOL * _Nonnull stop) {
        [obj cancel];
    }];
}

- (void)cancelRequestWithkey:(NSString *)key{
    NSURLSessionDataTask *task = [_requestTask objectForKey:key];
    if (task) {
        [task cancel];
        [_requestTask removeObjectForKey:key];
    }
}

- (void)postRequestWithAPI:(NSString *)api
                withParams:(NSDictionary *)params
                   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    NSString *urlString = nil;
    urlString = [NSString stringWithFormat:@"%@%@",BASE_URL,api];
    [self postRequestWithUrl:urlString withParams:params success:success failure:failure];
}

- (void)getRequestWithAPI:(NSString *)api
                withParams:(NSDictionary *)params
                   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    NSString *urlString = nil;
    urlString = [NSString stringWithFormat:@"%@%@",BASE_URL,api];
    [self getRequestWithUrl:urlString withParams:params success:success failure:failure];
}

- (void)postRequestWithUrl:(NSString *)urlString
                                  withParams:(NSDictionary *)params
                   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    [[RLSesionManager shareInstance]postRequestWithUrl:urlString withParams:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSInteger statusCode = [(NSHTTPURLResponse *)(task.response) statusCode];
        if (statusCode != 200) {
            if (failure) {
                NSError *error = [[NSError alloc]initWithDomain:RlnetHelperReponseDomian code:statusCode userInfo:@{RlnetHelperReponseDomian:@"服务器异常"}];
                failure(task,error);
            }else{
                if (success) {
                    success(task,responseObject);
                }
            }
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSInteger statusCode = [(NSHTTPURLResponse *)(task.response) statusCode];
        NSError *myerror = [[NSError alloc]initWithDomain:RlnetHelperReponseDomian code:statusCode userInfo:@{RlnetHelperReponseUserDomianKey:@"网络异常异常"}];
        failure(task,myerror);

    }];
}

- (void)getRequestWithUrl:(NSString *)urlString
                withParams:(NSDictionary *)params
                   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    [[RLSesionManager shareInstance] postRequestWithUrl:urlString withParams:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSInteger statusCode = [(NSHTTPURLResponse *)(task.response) statusCode];
        if (statusCode != 200) {
            NSError *error = [[NSError alloc]initWithDomain:RlnetHelperReponseDomian code:statusCode userInfo:@{RlnetHelperReponseUserDomianKey:@"服务器异常"}];
            failure(task,error);
        }else{
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSInteger statusCode = [(NSHTTPURLResponse *)(task.response) statusCode];
        NSError *myerror = [[NSError alloc]initWithDomain:RlnetHelperReponseDomian code:statusCode userInfo:@{RlnetHelperReponseUserDomianKey:@"网络异常"}];
        failure(task,myerror);
    }];
}

@end
