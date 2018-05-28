//
//  RLBaseDao+FirstPage.m
//  NetWorking
//
//  Created by 耿荣林 on 2018/5/28.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "RLBaseDao+FirstPage.h"
#import "DealData.h"

static NSString *api = @"videos/A1100101.shtml";
@implementation RLBaseDao (FirstPage)
- (void)getVideoDataWithpageNum:(NSString *)number withuserId:(NSString *)userId withModelName:(NSString *)modelName{
    [self.netHelper postRequestWithAPI:api withParams:@{@"number":number,@"userId":userId} success:^(NSURLSessionDataTask *task, id responseObject) {
      NSArray *array = [DealData dealDataWithModelName:modelName dicObject:responseObject isArray:YES];
        [self notifictionWithResponse:array withType:@"getvideosucess"];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self notifictionWithResponse:error withType:@"getvideoerror"];
    }];
}

- (void)notifictionWithResponse:(id)Response withType:(NSString *)type{
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter postNotificationName:type object:Response];
}
@end
