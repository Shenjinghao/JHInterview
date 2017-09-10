//
//  LoadClassB.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/10.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "LoadClassB.h"

@implementation LoadClassB

+ (void)load {
    NSLog(@"loading LoadClassB");
}

- (void)setName:(NSString *)name {
    _name = @"LoadClassB : hello world";
}

@end
