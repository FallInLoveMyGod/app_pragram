//
//  SystemManager.h
//  wash_bar
//
//  Created by 田耀琦 on 2017/7/28.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SystemManager : NSObject

@property (nonatomic,assign)NSInteger userId;

@property (nonatomic,strong)NSString *login_id;

@property (nonatomic,assign)BOOL isLogin;

@property (nonatomic,strong)NSString *token;

+ (id)shareManager;



@end
