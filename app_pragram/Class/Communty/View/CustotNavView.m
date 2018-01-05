//
//  CustotNavView.m
//  app_pragram
//
//  Created by 田耀琦 on 2018/1/4.
//  Copyright © 2018年 self. All rights reserved.
//

#import "CustotNavView.h"
#import "CollectionViewCell.h"
@interface CustotNavView () <UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *_collectionView;
    NSArray *_arr;
}

@end

static NSString *identify = @"CollectionViewCell";
@implementation CustotNavView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    _arr = @[@"item1",@"item2",@"item33333",@"item4",@"5",@"item666666",@"item777",@"item8",@"item9",@"item1000000000"];
    
    self.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.estimatedItemSize = CGSizeMake(100, 44);
    if (@available(iOS 10.0, *)) {
        layout.itemSize = UICollectionViewFlowLayoutAutomaticSize;
    } else {
        layout.itemSize = CGSizeMake(_collectionView.bounds.size.width, 70);
    }
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 100, 70) collectionViewLayout:layout];
//    _collectionView.collectionViewLayout = layout;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.pagingEnabled = YES;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:identify];
}

- (void)setDataArr:(NSArray *)dataArr {
    _arr = dataArr;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.lab.text = _arr[indexPath.row];
    cell.imageV.backgroundColor = [UIColor blueColor];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arr.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(rb_collectionViewItemDidSelectWithIndexPath:)]) {
        [self.delegate rb_collectionViewItemDidSelectWithIndexPath:indexPath];
    }
}






@end
