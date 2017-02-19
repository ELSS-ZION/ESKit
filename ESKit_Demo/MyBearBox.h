//
//  MyBearBox.h
//  MyBearBox
//
//  Created by Snick on 16/10/11.
//  Copyright © 2016年 Snick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESBearBox.h"


@interface MyBearBox : ESBearBox

#pragma mark - 数据源数组

/** 模型数组 */
//@property (strong, nonatomic) NSArray<MyBearBoxItem *> *items;

/** 图片数组 */
@property (strong, nonatomic) NSArray<UIImage *> *images;

/** 图片名数组 */
@property (strong, nonatomic) NSArray<NSString *> *imageNames;

/** URL数组*/
@property (strong, nonatomic) NSArray<NSURL *> *urls;

/** URL名数组*/
@property (strong, nonatomic) NSArray<NSString *> *urlStrs;

// 只要对以上属性的其中一个赋值，就可以展示数据


#pragma mark - 个性化设置

/** 一行最多展示多少张图片 默认为3 */
//@property (assign, nonatomic) unsigned long maxCols;

/** 图片数大于1时，图片尺寸 */
@property (assign, nonatomic) CGSize minImageSize;

/** 只有一张图片时，图片尺寸 默认为3倍的minImageSize的宽高*/
@property (assign, nonatomic) CGSize maxImageSize;

/** 通过frame来确定位置时，可以通过这个属性调整 */
@property (nonatomic, assign) CGPoint origin;

/** 图片之间的间隙宽度 */
@property (assign, nonatomic) CGFloat divide;


#pragma mark - 类工厂方法

+ (instancetype)bearBoxWithOrigin:(CGPoint)origin Items:(NSArray<UIView *> *) items;
+ (instancetype)bearBoxWithOrigin:(CGPoint)origin images:(NSArray<UIImage *> *)images;
+ (instancetype)bearBoxWithOrigin:(CGPoint)origin urls:(NSArray<NSURL *> *)urls;

+ (instancetype)bearBoxWithOrigin:(CGPoint)origin imageNames:(NSArray<NSString *> *)imageNames;
+ (instancetype)bearBoxWithOrigin:(CGPoint)origin urlStrs:(NSArray<NSString *> *)urlStrs;
//- (void)resetSize;
@end
