//
//  ESBearBox.m
//  ESKit_Demo
//
//  Created by ELSS on 2017/2/15.
//  Copyright © 2017年 ELSS. All rights reserved.
//

#import "ESBearBox.h"
#import "ESBearBoxLayout.h"

static NSString * const ReuseID = @"Cell";

@implementation ESBearBox

- (instancetype)initWithFrame:(CGRect)frame
{
    ESBearBox *instance = [super initWithFrame:frame collectionViewLayout:[[ESBearBoxLayout alloc] init]];
    
    [instance setup];
    return instance;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.collectionViewLayout = [[ESBearBoxLayout alloc] init];
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.dataSource = self;
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ReuseID];
}

#pragma mark - Property

- (void)setItems:(NSArray<UIView *> *)items
{
    _items = items;
    [self reloadData];
}

- (void)setItemSize:(CGSize)itemSize
{
    _itemSize = itemSize;
    ESBearBoxLayout *layout = (ESBearBoxLayout *)self.collectionViewLayout;
    layout.itemSize = itemSize;
}

- (void)setMaxCols:(unsigned long)maxCols
{
    _maxCols = maxCols;
    ESBearBoxLayout *layout = (ESBearBoxLayout *)self.collectionViewLayout;
    layout.maxCols = maxCols;
}

- (void)setInternalItemSpacing:(CGSize)internalItemSpacing
{
    _internalItemSpacing = internalItemSpacing;
    ESBearBoxLayout *layout = (ESBearBoxLayout *)self.collectionViewLayout;
    layout.internalItemSpacing = internalItemSpacing;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseID forIndexPath:indexPath];
    
    for (UIView *subView in cell.subviews) {
        [subView removeFromSuperview];
    }
    
    [cell addSubview:self.items[indexPath.row]];
    self.items[indexPath.row].frame = cell.bounds;
    cell.backgroundColor = [UIColor yellowColor];
    cell.clipsToBounds = YES;
    return cell;
}

@end