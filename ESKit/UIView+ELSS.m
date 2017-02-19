//
//  UIView+ELSS.m
//  ESKit_Demo
//
//  Created by ELSS on 2017/2/16.
//  Copyright © 2017年 ELSS. All rights reserved.
//

#import "UIView+ELSS.h"

@implementation UIView (ELSS)

- (id)copyWithZone:(NSZone *)zone
{
    UIView *instance = [[self.class allocWithZone:zone] init];
    
    return self;
}

@end
