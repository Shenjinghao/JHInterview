//
//  CaculateMaker.h
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/11.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import <Foundation/Foundation.h>


//http://blog.csdn.net/weimeng809/article/details/49280313

@interface CaculateManager : NSObject

@property (nonatomic, assign) int result;


/**
 block作为返回值
 */
- (CaculateManager *(^)(int))add;

- (CaculateManager *(^)(int))sub;


@end
