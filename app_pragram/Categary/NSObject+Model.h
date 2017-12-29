//
//  NSObject+Model.h
//  app_pragram
//
//  Created by 田耀琦 on 2017/12/26.
//  Copyright © 2017年 self. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 *  处理如 id 的替换或 dic --> model
 */
@interface NSObject (Model)

+ (instancetype)modelWithDict:(NSDictionary *)dict;

+ (instancetype)modelWithDict:(NSDictionary *)dict updateDict:(NSDictionary *)updateDic;

@end
