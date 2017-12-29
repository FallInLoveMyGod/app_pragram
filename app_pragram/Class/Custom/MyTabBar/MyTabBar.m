//
//  MyTabBar.m
//  GG
//
//  Created by 田耀琦 on 2017/12/25.
//  Copyright © 2017年 self. All rights reserved.
//

#import "MyTabBar.h"

@interface MyTabBar()

@property (nonatomic,strong) UIButton *centerBtn;

@end

@implementation MyTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [addBtn addTarget:self action:@selector(addBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//        [addBtn setImage:[UIImage imageNamed:@"center1"] forState:UIControlStateNormal];
        [addBtn setBackgroundImage:[UIImage imageNamed:@"center1"] forState:UIControlStateNormal];
        [self addSubview:addBtn];
        self.centerBtn = addBtn;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1) {
            UIImageView *line = (UIImageView *)view;
            line.hidden = YES;
        }
    }
    CGFloat centerX = self.bounds.size.width / 2.0;
    CGFloat centerY = self.bounds.size.height / 2.0 - 5;  // sfff
    [self.centerBtn setFrame:CGRectMake(0, 0, self.centerBtn.currentBackgroundImage.size.width, self.centerBtn.currentBackgroundImage.size.height)];
//    [self.centerBtn setFrame:CGRectMake(0, 0, 100, 100)];
    self.centerBtn.center = CGPointMake(centerX, centerY);
    
    int btnIndex = 0;
    for (UIView *btn in self.subviews) {
        if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            CGRect rect = CGRectMake(btnIndex * self.frame.size.width / 3.0, self.bounds.origin.y, self.frame.size.width / 3.0, self.frame.size.height);
            btn.frame = rect;
//            btn.backgroundColor = [UIColor redColor];
            btnIndex ++;
            if (btnIndex == 1) {
                btnIndex ++;
            }
        }
    }
    [self bringSubviewToFront:self.centerBtn];
}

- (void)setHasLine:(BOOL)hasLine {
    if (hasLine == NO) {
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1) {
                UIImageView *line = (UIImageView *)view;
                line.hidden = YES;
            }
        }
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (self.isHidden == NO) {
        CGPoint newA = [self convertPoint:point toView:self.centerBtn];
        if ([self.centerBtn pointInside:newA withEvent:event]) {
            return self.centerBtn;
        }
        else {
            return [super hitTest:point withEvent:event];
        }
    }
    else {
        return [super hitTest:point withEvent:event];
    }
}

#pragma mark - Handle Action
- (void)addBtnAction:(id)btn {
    if ([self.myDelegate respondsToSelector:@selector(addCenterAction:)]) {
        [self.myDelegate addCenterAction:btn];
    }
}

@end
