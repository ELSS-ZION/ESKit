//
//  ESBearBoxLayout.m
//  ESKit_Demo
//
//  Created by ELSS on 2017/2/14.
//  Copyright © 2017年 ELSS. All rights reserved.
//

#import "ESBearBoxLayout.h"

@implementation ESBearBoxLayout

- (void)prepareLayout
{
    [super prepareLayout];
    if (self.maxCols == 0) {
        self.maxCols = 3;
    }
    
    if (self.itemSize.width == 0 || self.itemSize.height == 0) {
        self.itemSize = CGSizeMake(50, 50);
    }
    
    self.itemCount = [self.collectionView numberOfItemsInSection:0];
    
}

- (CGSize)collectionViewContentSize
{
    if (self.itemCount == 0) {
        return CGSizeZero;
    }
    
    CGFloat width;
    if (self.itemCount < self.maxCols) {
        width = self.itemSize.width * self.itemCount + self.internalItemSpacing.width * (self.itemCount -1);
    }else {
        width = self.itemSize.width * self.maxCols + self.internalItemSpacing.width * (self.maxCols - 1);
    }
    
    NSUInteger rowCount = (self.itemCount - 1) / self.maxCols + 1;
    CGFloat height = self.itemSize.height * (CGFloat)rowCount + (rowCount - 1) * self.internalItemSpacing.height;
    
    self.collectionView.frame = CGRectMake(self.collectionView.frame.origin.x, self.collectionView.frame.origin.y, width, height);
    
    for (NSLayoutConstraint *constraint in self.collectionView.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth) {
            constraint.constant = width;
        }
        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
            constraint.constant = height;
        }
    }
    return CGSizeMake(width, height);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attr.size = self.itemSize;
    NSUInteger colNum = indexPath.row % self.maxCols;
    NSUInteger rowNum = indexPath.row / self.maxCols;
    attr.frame = CGRectMake(colNum * (self.itemSize.width + self.internalItemSpacing.width), rowNum * (self.itemSize.height + self.internalItemSpacing.height), self.itemSize.width, self.itemSize.height);
    
    return attr;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray<UICollectionViewLayoutAttributes *> *tmpArr = [NSMutableArray array];
    for (int i=0; i<self.itemCount; i++) {
        [tmpArr addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
    return tmpArr;
}

@end
