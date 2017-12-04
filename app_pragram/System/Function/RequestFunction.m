//
//  RequestFunction.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/26.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "RequestFunction.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
    Stuff; \
    _Pragma("clang diagnostic pop") \
} while (0)    // 消除警告

@implementation RequestFunction

+ (void)requestPostWithUrl:(NSString *)url target:(id)aTarget selector:(SEL)selector parameter:(NSDictionary *)parameter {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    if (token != nil || [token  isEqual: @""]) {
//        [manager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
//    }    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript" ,nil];
    [manager POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (selector) {
            SuppressPerformSelectorLeakWarning([aTarget performSelector:selector withObject:responseObject afterDelay:0]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        SuppressPerformSelectorLeakWarning([aTarget performSelector:selector withObject:error afterDelay:0]);
    }];
}

+ (void)requestGetWithUrl:(NSString *)url target:(id)aTarget selector:(SEL)aSelector {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        SuppressPerformSelectorLeakWarning([aTarget performSelector:aSelector withObject:responseObject afterDelay:0]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        SuppressPerformSelectorLeakWarning([aTarget performSelector:aSelector withObject:error afterDelay:0]);
    }];
}

+ (void)requestPostWithUrl:(NSString *)url upLoad:(UpLoad)upLoad target:(id)aTarget selector:(SEL)aSelector parameter:(NSDictionary *_Nullable)parameter {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript" ,nil];
    [manager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        upLoad(formData);
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         SuppressPerformSelectorLeakWarning([aTarget performSelector:aSelector withObject:responseObject afterDelay:0]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         SuppressPerformSelectorLeakWarning([aTarget performSelector:aSelector withObject:error afterDelay:0]);
    }];
}

// header
+ (void)requestPostWithHeaderWithUrl:(NSString *)url target:(id)aTarget selector:(SEL)selector parameter:(NSDictionary *)parameter {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript" ,nil];
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:parameter error:nil];
    [request addValue:[[SystemManager shareManager] token] forHTTPHeaderField:@"token"];
    [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        SuppressPerformSelectorLeakWarning([aTarget performSelector:selector withObject:error afterDelay:0]);
    }];
}


@end
