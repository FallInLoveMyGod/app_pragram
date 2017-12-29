//
//  MyTabBar.h
//  GG
//
//  Created by 田耀琦 on 2017/12/25.
//  Copyright © 2017年 self. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyTabBar;

@protocol MyTabBarDelegate <NSObject>

- (void)addCenterAction:(id)btn;

@end

@interface MyTabBar : UITabBar

@property (nonatomic,weak)id<MyTabBarDelegate> myDelegate;

@property (nonatomic,assign)BOOL hasLine;

@end
