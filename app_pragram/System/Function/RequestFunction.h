//
//  RequestFunction.h
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/26.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void (^UpLoad)(id<AFMultipartFormData>  _Nonnull formData);

@interface RequestFunction : NSObject

@property (nonatomic,copy)UpLoad _Nullable upLoad;

+ (void)requestPostWithUrl:(NSString *_Nonnull)url target:(id _Nonnull)aTarget selector:(SEL _Nullable)selector parameter:(NSDictionary *_Nullable)parameter; // POST

+ (void)requestGetWithUrl:(NSString *_Nonnull)url target:(id _Nonnull)aTarget selector:(SEL _Nullable)aSelector;  // GET

+ (void)requestPostWithUrl:(NSString *_Nonnull)url upLoad:(UpLoad _Nullable)upLoad target:(id _Nonnull)aTarget selector:(SEL _Nullable)aSelector parameter:(NSDictionary *_Nullable)parameter;

// 带有header 参数
+ (void)requestPostWithHeaderWithUrl:(NSString *_Nullable)url target:(id _Nullable )aTarget selector:(SEL _Nullable )selector parameter:(NSDictionary *_Nullable)parameter;

@end
