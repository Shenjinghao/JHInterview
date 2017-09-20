//
//  CaculateMaker.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/11.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "CaculateManager.h"

@implementation CaculateManager

- (CaculateManager *(^)(int))add {
    // 返回block
    // 先定义block
    return ^CaculateManager *(int result) {
        _result += result;
        return self;
    };
}

- (CaculateManager *(^)(int))sub {
    return ^CaculateManager *(int result) {
        if (_result == 0) {
            _result = result;
        }else {
            
            _result -= result;
        }
        return self;
    };
}

@end
