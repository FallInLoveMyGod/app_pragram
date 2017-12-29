//
//  ConfigFunction.m
//  fieldwork_2088
//
//  Created by 田耀琦 on 2017/5/31.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "ConfigFunction.h"

@implementation ConfigFunction

//  字符串是否为空
+ (BOOL)xfunc_emptyWithString:(NSString *)string {
    if ([string isEqualToString:@""] || string.length == 0 || string == nil) {
        return YES;
    }
    return NO;
}

// 本地json 转换成字典
+ (NSDictionary *)dicFromLocalJsonWithFileName:(NSString *)fileName {
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSString *jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
}

//  电话号码是否合法
+ (BOOL)xfunc_isValidMobileNumber:(NSString *)mobileNum {
    if (mobileNum.length != 11) {
        return NO;
    }
    else {
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobileNum];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobileNum];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobileNum];
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }
        return NO;
    }   
}

// 获取视图根代理
+ (AppDelegate *)xfunc_getAppDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

#pragma mark - 根据给定日期 获取 年 月 日
+ (NSString *)xfunc_getStringFromNow:(NSDate *)date {
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日HH:mm"];
    NSString *dateStr = [dateFormatter stringFromDate:now];
    return dateStr;
}

+ (NSString *)xfunc_getHourStringFromHour:(int)hour {
    NSString *hourStr;
    if (hour < 10) {
        hourStr = [NSString stringWithFormat:@"0%d",hour];
    }
    else {
        hourStr = [NSString stringWithFormat:@"%d",hour];
    }
    return hourStr;
}

+ (NSString *)xfunc_getMiniteStringFromMinite:(int)minite {
    NSString *miniteStr;
    if (minite < 10) {
        miniteStr = [NSString stringWithFormat:@"0%d",minite];
    }
    else {
        miniteStr = [NSString stringWithFormat:@"%d",minite];
    }
    return miniteStr;
}

#pragma mark - 根据一定高度/宽度返回宽度/高度
/**
 *  @brief  根据一定高度/宽度返回宽度/高度
 *  @category
 *  @param  goalString            目标字符串
 *  @param  font                 字号
 *  @param  fixedSize            固定的宽/高
 *  @param  isWidth              是否是宽固定(用于区别宽/高)
 **/
// 根据文字（宽度/高度一定,字号一定的情况下）  算出高度/宽度
+ (CGSize)xfunc_getStringSizeWith:(NSString *)goalString withStringFont:(CGFloat)font withWidthOrHeight:(CGFloat)fixedSize isWidthFixed:(BOOL)isWidth{
    
    CGSize sizeC ;
    
    if (isWidth) {
        sizeC = CGSizeMake(fixedSize ,MAXFLOAT);
    }else{
        sizeC = CGSizeMake(MAXFLOAT ,fixedSize);
    }
    
    CGSize sizeFileName = [goalString boundingRectWithSize:sizeC options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return sizeFileName;
}

+ (void)xfunc_OpenHudWithMessage:(NSString *)message toView:(UIView *)view{
    if (view == nil) {
        AppDelegate *delegate = [self xfunc_getAppDelegate];
        view = delegate.window;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = message;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
//    hud.bezelView.backgroundColor = [UIColor redColor];
    [view addSubview:hud];
    
    [hud hideAnimated:YES afterDelay:2.0];
    [hud setRemoveFromSuperViewOnHide:YES];
    hud = nil;
}

+ (NSString *)xfunc_getErrorTipFromError:(NSError *)error {
    NSDictionary *dic = error.userInfo;
    NSString *tipString = [dic valueForKey:@"NSLocalizedDescription"];
    return tipString;
}

// 网络状态
+ (BOOL)xfunc_canConnectNet {
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:  // 无网络
            return NO;
            break;
        case ReachableViaWiFi:  // wifi
            return YES;
            break;
        case ReachableViaWWAN:  // wwlan网络
            return YES;
            
        default:
            break;
    }
    return NO;
}

+ (BOOL)xfunc_canConnectWifi {
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:  // 无网络
            return NO;
            break;
        case ReachableViaWiFi:  // wifi
            return YES;
            break;
        case ReachableViaWWAN:  // wwlan网络
            return NO;
            
        default:
            break;
    }
    return NO;
}

+ (int)getRandomNumber:(int)from to:(int)to

{
    
    return (int)(from + (arc4random() % (to - from + 1)));
    
}

@end
