//
//  LoadClassA+LoadClassACategory.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/10.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "LoadClassA+LoadClassACategory.h"

@implementation LoadClassA (LoadClassACategory)

+ (void)load {
    //类的实现要比分类category要早
    NSLog(@"Loading LoadClassACategory");
}

@end
