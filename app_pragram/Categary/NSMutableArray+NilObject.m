//
//  NSMutableArray+NilObject.m
//  app_pragram
//
//  Created by 田耀琦 on 2017/12/26.
//  Copyright © 2017年 self. All rights reserved.
//

#import "NSMutableArray+NilObject.h"
#import <objc/runtime.h>

@implementation NSMutableArray (NilObject)

+ (void)load {
    Method originMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject:));
    Method newMethod = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(gp_addObject:));
    method_exchangeImplementations(originMethod, newMethod);
}

- (void)gp_addObject:(id)object {
    if (object != nil) {
        [self gp_addObject:object];
    }
}

@end
