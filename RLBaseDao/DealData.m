//
//  DealData.m
//  NetWork
//
//  Created by 耿荣林 on 18/3/19.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "DealData.h"
#import <objc/message.h>

@implementation DealData
//获取类的所有属性名
+ (NSArray *)getPropertieNamesByClassName:(Class)className
{
    unsigned int outCount, i;
    // 获取注册类的属性列表，第一个参数是类，第二个参数是接收类属性数目的变量
    objc_property_t *properties = class_copyPropertyList([className class], &outCount);
    //定义一个数组来接收获取的属性名
    NSMutableArray *nameArray = [[NSMutableArray alloc] initWithCapacity:outCount];
    for (i = 0; i < outCount; i++) {
        //通过循环来获取单个属性
        objc_property_t property = properties[i];
        //取得属性名
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        //将得到的属性名放入数组中
        [nameArray addObject:propertyName];
    }
    free(properties);
    return nameArray;
}

+ (id)dealDataWithModelName:(NSString *)modelName dicObject:(NSObject *)dicObject{
    Class className = NSClassFromString(modelName);
    id object = [[className alloc]init];
    BOOL ret = NO;
    for (NSString *key in [self getPropertieNamesByClassName:className]) {
        if ([dicObject isKindOfClass:[NSDictionary class]]) {
            ret = ([dicObject valueForKey:key] == nil) ? NO : YES;
        }else{
            ret = [dicObject respondsToSelector:NSSelectorFromString(key)];
        }
        if (ret) {
            id propertyValue = [dicObject valueForKey:key];
             //不为NSNULL，并且也不为nil
            if (![propertyValue isKindOfClass:[NSNull class]] && propertyValue != nil) {
                //使用KVC的方式做模型转换
                [object setValue:propertyValue forKey:key];
            }
        }
    }
    return object;
}

+ (id)dealDataWithModelName:(NSString *)modelName dicObject:(NSObject *)dicObject isArray:(BOOL)isArray{
    if(!isArray){
        return [self dealDataWithModelName:modelName dicObject:dicObject];
    }else{
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        NSArray *tempArr = (NSArray*)dicObject;
        for (NSObject *dic in tempArr) {
            [arr addObject:[self dealDataWithModelName:modelName dicObject:dic]];
        }
        return arr;
    }
}

@end
