//
//  HWBaseAlertView.m
//  TemplateTest
//
//  Created by caijingpeng on 15/11/3.
//  Copyright (c) 2015年 caijingpeng.haowu. All rights reserved.
//

#import "HWBaseAlertView.h"

@implementation HWBaseAlertView

#pragma mark - 显示

- (void)show
{
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    CABasicAnimation *posy = [CABasicAnimation animationWithKeyPath:@"position.y"];
    posy.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    posy.duration = 0.3;
    posy.fromValue = [NSNumber numberWithFloat:0];
    posy.toValue = [NSNumber numberWithFloat:CGRectGetMidY(_handleView.frame)];
    
    CABasicAnimation *opacity=[CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    opacity.duration = 0.25;
    opacity.fromValue = [NSNumber numberWithFloat:0];
    opacity.toValue = [NSNumber numberWithFloat:1];
    
    [_handleView.layer addAnimation:posy forKey:@"sc"];
    [_handleView.layer addAnimation:opacity forKey:@"op"];
    
    [UIView animateWithDuration:0.3f animations:^{
        //self.backgroundColor = AlertBackControlColor;
    }];
}

- (void)hide
{
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    
    CABasicAnimation *posy = [CABasicAnimation animationWithKeyPath:@"position.y"];
    posy.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    posy.duration = 0.3;
    posy.fromValue = [NSNumber numberWithFloat:CGRectGetMidY(_handleView.frame)];
    posy.toValue = [NSNumber numberWithFloat:CGRectGetMaxY([UIScreen mainScreen].bounds)];
    
    CABasicAnimation *opacity=[CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    opacity.duration = 0.25;
    opacity.fromValue = [NSNumber numberWithFloat:0];
    opacity.toValue = [NSNumber numberWithFloat:1];
    
    [_handleView.layer addAnimation:posy forKey:@"sc"];
    [_handleView.layer addAnimation:opacity forKey:@"op"];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundColor = [UIColor clearColor];
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

@end
