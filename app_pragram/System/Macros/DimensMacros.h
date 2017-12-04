//
//  DimensMacros.h
//  TiWeiAnYao
//
//  Created by 田耀琦 on 2017/5/23.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#ifndef DimensMacros_h
#define DimensMacros_h

/*
 *     尺寸相关宏定义
*/

#endif /* DimensMacros_h */


#define App_Width [UIScreen mainScreen].bounds.size.width
#define App_Height [UIScreen mainScreen].bounds.size.height

#define App_StatusBarH [[UIApplication sharedApplication] statusBarFrame].size.height
#define App_NavBarH self.navigationController.navigationBar.frame.size.height
#define App_TabBarH self.tabBarController.tabBar.frame.size.height

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone8Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
