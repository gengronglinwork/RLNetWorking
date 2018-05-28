//
//  RLSesionManager.m
//  NetWorking
//
//  Created by 耿荣林 on 2018/5/22.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "RLSesionManager.h"
#import "AFNetworking.h"
@interface RLSesionManager()
@property (nonatomic,strong) AFHTTPSessionManager *sessionManager;
@end

@implementation RLSesionManager
+ (instancetype)shareInstance{
    static RLSesionManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[RLSesionManager alloc]init];
    });
    return instance;
}

-(instancetype)init{
    if (self = [super init]) {
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sessionManager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:config];
        AFJSONResponseSerializer *responds = [[AFJSONResponseSerializer alloc]init];
        responds.acceptableContentTypes = [NSSet setWithObjects:@"text/json", @"text/xml",nil];
    }
    return self;
}

- (NSURLSessionDataTask *)getRequestWithUrl:(NSString *)urlString
               withParams:(NSDictionary *)params
                                    success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                    failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
   return [_sessionManager GET:urlString parameters:params success:success failure:failure];
}

- (NSURLSessionDataTask *)postRequestWithUrl:(NSString *)urlString
                                  withParams:(NSDictionary *)params
                                     success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
   return [_sessionManager POST:urlString parameters:params success:success failure:failure];
}


@end
