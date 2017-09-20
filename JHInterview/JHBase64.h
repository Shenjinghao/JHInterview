//
//  JHBase64.h
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/13.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHBase64 : NSObject
//http://www.cnblogs.com/cqb-learner/p/5867804.html
+ (NSString *)base64EncodeString:(NSString *)string;

+ (NSString *)base64DecodeString:(NSString *)string;

@end
