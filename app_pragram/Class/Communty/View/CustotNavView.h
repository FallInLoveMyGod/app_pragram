//
//  CustotNavView.h
//  app_pragram
//
//  Created by 田耀琦 on 2018/1/4.
//  Copyright © 2018年 self. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavDelegate <NSObject>

- (void)rb_collectionViewItemDidSelectWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface CustotNavView : UIView

@property (nonatomic,assign)id<NavDelegate> delegate;

@property (nonatomic,strong)NSArray *dataArr;

@end
