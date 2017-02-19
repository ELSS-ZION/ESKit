//
//  ESBearBoxLayout.h
//  ESKit_Demo
//
//  Created by ELSS on 2017/2/14.
//  Copyright © 2017年 ELSS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESBearBoxLayout : UICollectionViewLayout

@property (assign, nonatomic) unsigned long maxCols;
@property (assign, nonatomic) CGSize internalItemSpacing;
@property (assign, nonatomic) CGSize itemSize;
@property (assign, nonatomic) NSUInteger itemCount;

@end
