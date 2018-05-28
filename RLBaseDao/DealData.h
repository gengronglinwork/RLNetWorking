//
//  DealData.h
//  NetWork
//
//  Created by 耿荣林 on 18/3/19.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DealData : NSObject
/**
 描述：把字典值转成对象
 输入参数：
 ModelName：指定对象类名 比如：@"Student"
 DicObject:字典
 返回值：转换完成的对象
 **/
+ (id)dealDataWithModelName:(NSString *)modelName dicObject:(NSObject *)dicObject;
/**
 描述：把 数组－字典 类型转换成 数组－对象 类型
 输入参数：
 ModelName：指定对象类名 比如：@"Student"
 DicObject:数组－字典
 返回值：转换完成的对象
 **/
+ (id)dealDataWithModelName:(NSString *)modelName dicObject:(NSObject *)dicObject isArray:(BOOL)isArray;






@end
