//
//  ESBearBox.h
//  ESKit_Demo
//
//  Created by ELSS on 2017/2/15.
//  Copyright © 2017年 ELSS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESBearBox : UICollectionView
<
UICollectionViewDataSource
>

@property (strong, nonatomic) NSArray<UIView *> *items;
@property (assign, nonatomic) CGSize itemSize;
@property (assign, nonatomic) CGSize internalItemSpacing;
@property (assign, nonatomic) unsigned long maxCols;

@end
