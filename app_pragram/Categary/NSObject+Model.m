//
//  NSObject+Model.m
//  app_pragram
//
//  Created by 田耀琦 on 2017/12/26.
//  Copyright © 2017年 self. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/runtime.h>
@implementation NSObject (Model)

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    return [self modelWithDict:dict updateDict:nil];
}

+ (instancetype)modelWithDict:(NSDictionary *)dict updateDict:(NSDictionary *)updateDic {
    id model = [[self alloc] init];
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self, &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        ivarName = [ivarName substringFromIndex:1];
        id value = dict[ivarName];
        if (value == nil) {
            if (updateDic) {
                NSString *keyName = updateDic[ivarName];
                value = dict[keyName];
            }
        }
        [self setValue:value forKey:ivarName];
    }
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
