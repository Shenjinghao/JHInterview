//
//  NSObject+Caculate.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/11.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "NSObject+Caculate.h"
#import "CaculateManager.h"

@implementation NSObject (Caculate)

+ (int)calulate:(void (^)(CaculateManager *manager))block {
    // 1.创建计算管理者
    CaculateManager *manager = [[CaculateManager alloc] init];
    
    block(manager);
    return manager.result;
    
}

@end
