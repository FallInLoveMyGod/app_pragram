//
//  ACommunityVC.m
//  TiWeiAnYao
//
//  Created by 田耀琦 on 2017/5/23.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "ACommunityVC.h"
#import <TYPagerController/TYPagerController.h>
#import "CustotNavView.h"
#import "HeaderReusableView.h"
@interface ACommunityVC () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,NavDelegate>

@property (nonatomic,strong)UICollectionView *myCollect;

@property (nonatomic,assign)int count;

@end
static NSString *identify = @"UICollectionViewCell";
static NSString *headerIdentify = @"UICollectionReusableView";
static NSString *customHeader = @"HeaderReusableView";
@implementation ACommunityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    
}

- (void)creatUI {
    CustotNavView *navView = [[CustotNavView alloc] initWithFrame:CGRectMake(0, 0, App_Width, 80)];
    navView.delegate = self;
    [self.view addSubview:navView];
    
    self.count = 0;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 10;
    layout.estimatedItemSize = CGSizeMake((App_Width - 30)/2.0, (App_Width - 30)/2.0);
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.headerReferenceSize = CGSizeMake(App_Width, 44);

    self.myCollect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 80, App_Width, App_Height - 80 - App_StatusBarH - App_NavBarH - App_TabBarH) collectionViewLayout:layout];
    self.myCollect.backgroundColor = Color_View_Back;
    self.myCollect.delegate = self;
    self.myCollect.dataSource = self;
    self.myCollect.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.myCollect];
    
    [self.myCollect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identify];
    [self.myCollect registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentify];
    [self.myCollect registerNib:[UINib nibWithNibName:NSStringFromClass([HeaderReusableView class]) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:customHeader];
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.backgroundColor = Color_Text_Red;
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.count + 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  2;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:customHeader forIndexPath:indexPath];
//        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, App_Width, 44)];
//        lab.text = [NSString stringWithFormat:@"section %ld",(long)indexPath.section];
//        lab.textAlignment = NSTextAlignmentCenter;
//        [headerView addSubview:lab];
        headerView.headerTitle.text = [NSString stringWithFormat:@"section %ld",(long)indexPath.section];
//        headerView.backgroundColor = [UIColor greenColor];
        return headerView;
    }
    return nil;
}

#pragma mark - NavDelegate
- (void)rb_collectionViewItemDidSelectWithIndexPath:(NSIndexPath *)indexPath {
    self.count = (int)indexPath.row;
    [self.myCollect reloadData];
}




@end
