//
//  LoadVC.m
//  crazy_buying
//
//  Created by 田耀琦 on 2017/11/9.
//  Copyright © 2017年 juxiong. All rights reserved.
//

#import "LoadVC.h"
#import "RootVC.h"
@interface LoadVC () <UIScrollViewDelegate>

@property (nonatomic,strong)UIPageControl *page;

@end

@implementation LoadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self load_image];
}

- (void)load_image {
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, App_Width, App_Height)];
    scroll.contentSize = CGSizeMake(App_Width * 3, App_Height);
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.delegate = self;
    scroll.pagingEnabled = YES;
    [self.view addSubview:scroll];
    
    for (int i = 0; i < 3; i ++) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(App_Width * i, 0, App_Width, App_Height)];
        imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"loadImage%d",i + 1]];
        if (kDevice_Is_iPhoneX) {
            imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"loadImagex%d",i + 1]];
        }
        [scroll addSubview:imageV];
    }
    
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(App_Width / 2.0 - 50, App_Height * 0.78, 100, 30)];
    page.numberOfPages = 3;
    page.currentPage = 0;
    page.pageIndicatorTintColor = Color_Text_Gray;
    page.currentPageIndicatorTintColor = Color_Btn_Red;
    self.page = page;
    [self.view addSubview:page];
    
    UIButton *jumpOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [jumpOutBtn setFrame:CGRectMake(App_Width * 3 - 80, 44, 54, 22)];
    [jumpOutBtn setTitle:@"跳出" forState:UIControlStateNormal];
    [jumpOutBtn setTitleColor:Color_Text_Red forState:UIControlStateNormal];
    [jumpOutBtn addTarget:self action:@selector(jumpToHomePage:) forControlEvents:UIControlEventTouchUpInside];
    jumpOutBtn.layer.cornerRadius = 10;
    jumpOutBtn.layer.borderWidth = 1;
    jumpOutBtn.layer.borderColor = Color_Btn_Red.CGColor;
    jumpOutBtn.clipsToBounds = YES;
    [scroll addSubview:jumpOutBtn];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = scrollView.contentOffset.x / App_Width;
    self.page.currentPage = page;
}

#pragma mark - Handle Action
- (void)jumpToHomePage:(id)btn {
    RootVC *root = [[RootVC alloc] init];
    [ConfigFunction xfunc_getAppDelegate].window.rootViewController = root;
}

@end
