//
//  NSObject+Caculate.h
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/11.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CaculateManager;

@interface NSObject (Caculate)

// 计算
+ (int)calulate:(void (^)(CaculateManager *manager))block;

@end
