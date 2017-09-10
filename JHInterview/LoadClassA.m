//
//  LoadClassA.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/10.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "LoadClassA.h"
#import "LoadClassB.h"

@implementation LoadClassA

+ (void)load {
    NSLog(@"loading LoadClassA");
    
    LoadClassB *b = [[LoadClassB alloc] init];
    NSLog(@"%@",b.name);
    //此时的b的数据还没有准备好
}

@end
