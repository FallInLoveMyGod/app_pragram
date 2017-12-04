//
//  SystemManager.m
//  wash_bar
//
//  Created by 田耀琦 on 2017/7/28.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "SystemManager.h"

@implementation SystemManager

+ (id)shareManager {
    static SystemManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SystemManager alloc] init];
    });
    return manager;
}




@end
