//
//  RlnetHelper.h
//  NetWorking
//
//  Created by 耿荣林 on 2018/5/22.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RlnetHelper : NSObject
- (void)cancelRequest;
- (void)cancelRequestWithkey:(NSString *)key;
- (void)postRequestWithAPI:(NSString *)api
                withParams:(NSDictionary *)params
                   success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                   failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
- (void)getRequestWithAPI:(NSString *)api
               withParams:(NSDictionary *)params
                  success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                  failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
@end
