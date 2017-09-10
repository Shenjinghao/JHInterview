//
//  InitializeClassA.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/10.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "InitializeClassA.h"

@implementation InitializeClassA

+ (void)initialize {
    NSLog(@"%@  initialize",self);
    //不加类型判断，只会输出父类的方法，加上类型判断会都输出
    if (self == [InitializeClassA class]) {
        NSLog(@"%@  initialize",self);
    }
}

@end
