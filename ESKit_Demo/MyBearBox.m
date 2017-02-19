//
//  MyBearBox.m
//  MyBearBox
//
//  Created by Snick on 16/10/11.
//  Copyright © 2016年 Snick. All rights reserved.
//

#import "MyBearBox.h"
//#import "UIImageView+WebCache.h"



@interface MyBearBox ()
//@property (assign, nonatomic, readonly) CGSize shouldBeSize;
@end

@implementation MyBearBox
#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenWidth  kScreenBounds.size.width
#define kScreenHeight kScreenBounds.size.height

// 获取屏幕宽高比例
#define kScreenWidthRatio  (kScreenWidth  / 414.0f)
#define kScreenHeightRatio (kScreenHeight / 736.0f)

// 适配宽高度
#define  kAdaptedWidth(width)   (ceilf((width)  * kScreenWidthRatio))
#define  kAdaptedHeight(height) (ceilf((height) * kScreenHeightRatio))

#pragma mark - Property

//@synthesize minImageSize = _minImageSize;
//- (void)setMinImageSize:(CGSize)minImageSize {
//    _minImageSize = minImageSize;
////    [self resetSize];
//}

- (CGSize)minImageSize {
    if (_minImageSize.width == 0 || _minImageSize.height == 0) {
        
        _minImageSize.width = kAdaptedWidth(90);
        _minImageSize.height = kAdaptedHeight(90);
    }
    return _minImageSize;
}

//@synthesize maxCols = _maxCols;
//- (void)setMaxCols:(unsigned long)maxCols {
//    _maxCols = maxCols;
//    [self resetSize];
//}

//- (unsigned long)maxCols {
//    if (_maxCols == 0) {
//        _maxCols = 3;
//    }
//    return _maxCols;
//}

- (void)setOrigin:(CGPoint)origin {
    CGRect tmpFrame = self.frame;
    tmpFrame.origin = origin;
    self.frame = tmpFrame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

//- (void)setItems:(NSArray<MyBearBoxItem *> *)items {
//    _items = items;
//    
//    [self resetSize];
//    [self reloadData];
//}

- (void)setImages:(NSArray<UIImage *> *)images {
    _images = images;
    NSMutableArray<UIImageView *> *tmpArr = [NSMutableArray array];
    for (UIImage *image in images) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [tmpArr addObject:imageView];
    }
    self.items = tmpArr;
}

- (void)setImageNames:(NSArray<NSString *> *)imageNames {
    _imageNames = imageNames;
    NSMutableArray<UIImage *> *tmpArr = [NSMutableArray array];
    for (NSString *imageName in imageNames) {
        UIImage *image = [UIImage imageNamed:imageName];
        [tmpArr addObject:image];
    }
    [self setImages:tmpArr];
}

- (void)setUrls:(NSArray<NSURL *> *)urls {
    _urls = urls;
    NSMutableArray<UIImageView *> *tmpArr = [NSMutableArray array];
    for (NSURL *url in urls) {
        UIImageView *imageView = [[UIImageView alloc] init];
//        [imageView sd_setImageWithURL:url];
        [tmpArr addObject:imageView];
    }
    self.items = tmpArr;
}

- (void)setUrlStrs:(NSArray<NSString *> *)urlStrs {
    _urlStrs = urlStrs;
    NSMutableArray<NSURL *> *tmpArr = [NSMutableArray array];
    for (NSString *urlStr in urlStrs) {
        NSURL *url = [NSURL URLWithString:urlStr];
        [tmpArr addObject:url];
    }
    [self setUrls:tmpArr];
}

//@synthesize maxImageSize = _maxImageSize;
//- (void)setMaxImageSize:(CGSize)maxImageSize {
//    _maxImageSize = maxImageSize;
//    [self resetSize];
//}

- (CGSize)maxImageSize {
    if (_maxImageSize.width == 0 || _maxImageSize.height == 0) {
        _maxImageSize.width = self.minImageSize.width * 3;
        _maxImageSize.height = self.minImageSize.height * 3;
    }
    return _maxImageSize;
}

//@synthesize divide = _divide;
- (void)setDivide:(CGFloat)edgeWidth {
//    _divide = edgeWidth;
    self.internalItemSpacing = CGSizeMake(edgeWidth, edgeWidth);
//    [self resetSize];
}

- (CGFloat)divide {
    CGFloat divide = self.internalItemSpacing.width;
    if (divide == 0) {
        divide = 5;
    }
    return divide;
}

#pragma mark - Override

- (instancetype)initWithFrame:(CGRect)frame
{
    MyBearBox *instance = [super initWithFrame:frame];

    [instance setup];
    
    return instance;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Mine

+ (instancetype)bearBoxWithOrigin:(CGPoint)origin {
    MyBearBox *instance = [[self alloc] initWithFrame:CGRectMake(origin.x, origin.y, 0, 0)];
    return instance;
}

+ (instancetype)bearBoxWithOrigin:(CGPoint)origin Items:(NSArray<UIView *> *) items {
    MyBearBox *instance = [self bearBoxWithOrigin:origin];
    instance.items = items;
    return instance;
}

+ (instancetype)bearBoxWithOrigin:(CGPoint)origin images:(NSArray<UIImage *> *)images {
    MyBearBox *instance = [self bearBoxWithOrigin:origin];
    instance.images = images;
    return instance;
}

+ (instancetype)bearBoxWithOrigin:(CGPoint)origin urls:(NSArray<NSURL *> *)urls {
    MyBearBox *instance = [self bearBoxWithOrigin:origin];
    instance.urls = urls;
    return instance;
}

+ (instancetype)bearBoxWithOrigin:(CGPoint)origin imageNames:(NSArray<NSString *> *)imageNames {
    MyBearBox *instance = [self bearBoxWithOrigin:origin];
    [instance setImageNames:imageNames];
    return instance;
}

+ (instancetype)bearBoxWithOrigin:(CGPoint)origin urlStrs:(NSArray<NSString *> *)urlStrs {
    MyBearBox *instance = [self bearBoxWithOrigin:origin];
    [instance setUrlStrs:urlStrs];
    return instance;
}

//- (void)resetFrame {
//    
//    self.frame = CGRectMake(self.origin.x, self.origin.y, self.shouldBeSize.width, self.shouldBeSize.height);
//}

//- (void)resetConstraints {
//    
//    for (NSLayoutConstraint *constraint in self.constraints) {
//        if (constraint.firstAttribute == NSLayoutAttributeWidth) {
//            constraint.constant = self.shouldBeSize.width;
//        }
//        if (constraint.firstAttribute == NSLayoutAttributeHeight) {
//            constraint.constant = self.shouldBeSize.height;
//        }
//    }
//}

//- (void)resetSize {
//    [self resetFrame];
//    [self resetConstraints];
//    self.contentSize = self.shouldBeSize;
//}

//- (CGSize)shouldBeSize {
//    if (self.items.count == 0) {
//        return CGSizeMake(0, 0);
//    }
//
//    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
//    
//    if (self.items.count == 1) {
//        CGSize size = CGSizeMake(self.maxImageSize.width, self.maxImageSize.height);
//        UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
//        layout.itemSize = size;
//        return size;
//    }
//    
//    CGFloat width = self.minImageSize.width * self.maxCols + self.divide * 2;
//    NSUInteger rowCount = (self.items.count - 1) / self.maxCols + 1;
//    CGFloat height = self.minImageSize.height * (CGFloat)rowCount + (rowCount - 1) * self.divide;
//    layout.itemSize = self.minImageSize;
//    return CGSizeMake(width, height);
//}

- (void)setup {
    
//    self.backgroundColor = RGBColor(236, 237, 241);
    self.backgroundColor = [UIColor whiteColor];
    
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.minimumLineSpacing = self.divide;
//    layout.minimumInteritemSpacing = self.divide;
//    layout.itemSize = self.minImageSize;
//    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    self.collectionViewLayout = layout;
//    self.showsVerticalScrollIndicator = NO;
//    self.dataSource = self;
    
//    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfItemsInSection:(NSInteger)section
{
    NSInteger num = [super numberOfItemsInSection:section];
    
    if (num == 1) {
        self.itemSize = self.maxImageSize;
    }else {
        self.itemSize = self.minImageSize;
    }
    
    return num;
}
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return self.items.count;
//}

//static NSString * const reuseIdentifier = @"Cell";

//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//    for (UIView *subView in cell.subviews) {
//        [subView removeFromSuperview];
//    }
////    cell.backgroundColor = [UIColor redColor];
//    UIImageView *imageV = [[UIImageView alloc] initWithFrame:cell.bounds];
//    if (self.items[indexPath.row].image) {
//        imageV.image = self.items[indexPath.row].image;
//
//    } else {
//        [imageV sd_setImageWithURL:self.items[indexPath.row].imageURL];
//    }
//
//    
//    
//    if (self.items.count > 1) {
//        imageV.contentMode = UIViewContentModeScaleAspectFill;
//    } else {
//        imageV.contentMode = UIViewContentModeScaleAspectFit;
//    }
//    
//    imageV.clipsToBounds = YES;
//    
//    [cell addSubview:imageV];
//    return cell;
//}

@end
