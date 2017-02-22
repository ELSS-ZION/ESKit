//
//  ViewController.m
//  ESKit_Demo
//
//  Created by ELSS on 2017/2/14.
//  Copyright © 2017年 ELSS. All rights reserved.
//

#import "ViewController.h"
#import "ESBearBox.h"
#import "ESBearBoxLayout.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet ESBearBox *bearBox;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray<UIView *> *tmpArr = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        UIView *redView = [[UIView alloc] init];
        redView.backgroundColor = [UIColor redColor];
        [tmpArr addObject:redView];
    }


    
//    self.bearBox.itemSize = CGSizeMake(30, 30);
//    NSLog(@"%@", NSStringFromCGRect(self.bearBox.frame));
//    
//    self.bearBox.maxCols = 1;
//    NSLog(@"%@", NSStringFromCGRect(self.bearBox.frame));
//    
//    self.bearBox.internalItemSpacing = CGSizeMake(5, 5);
//    NSLog(@"%@", NSStringFromCGRect(self.bearBox.frame));
//    
//    self.bearBox.items = tmpArr;
//    NSLog(@"%@", NSStringFromCGRect(self.bearBox.frame));

    
    ESBearBox *bBox = [[ESBearBox alloc] initWithFrame:CGRectMake(88, 88, 0, 0)];
    bBox.items = tmpArr;
    bBox.itemSize = CGSizeMake(20, 20);
    bBox.internalItemSpacing = CGSizeMake(10, 10);
    [self.view addSubview:bBox];
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    NSLog(@"%@", NSStringFromCGRect(self.bearBox.frame));
//}

@end
