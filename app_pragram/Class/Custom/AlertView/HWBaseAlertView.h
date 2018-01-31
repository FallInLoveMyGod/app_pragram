//
//  HWBaseAlertView.h
//  TemplateTest
//
//  Created by caijingpeng on 15/11/3.
//  Copyright (c) 2015年 caijingpeng.haowu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AlertBackControlColor                       [UIColor colorWithWhite:0.0f alpha:0.3f]    //背景色

@interface HWBaseAlertView : UIView
{
    UIView *_handleView;                //操作视图
}

/**
 *	@brief  显示Alert在Window上.
 */
- (void)show;
- (void)hide;

@end
