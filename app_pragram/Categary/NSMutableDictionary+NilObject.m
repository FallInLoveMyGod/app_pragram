//
//  NSMutableDictionary+NilObject.m
//  app_pragram
//
//  Created by 田耀琦 on 2017/12/26.
//  Copyright © 2017年 self. All rights reserved.
//

#import "NSMutableDictionary+NilObject.h"
#import <objc/runtime.h>
@implementation NSMutableDictionary (NilObject)

+ (void)load {
    Method originMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(setObject:forKey:));
    Method newMethod = class_getInstanceMethod(NSClassFromString(@"__NSDictionaryM"), @selector(ex_setObject:forKey:));
    method_exchangeImplementations(originMethod, newMethod);
}

- (void)ex_setObject:(id)object forKey:(NSString *)key {
    if (object == nil) {
        [self ex_setObject:@"" forKey:key];
    }
    else {
        [self ex_setObject:object forKey:key];
    }
}

@end
