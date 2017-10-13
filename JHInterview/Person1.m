//
//  Person1.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/10.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "Person1.h"

@interface Person1 ()<NSCoding>

@end

@implementation Person1

- (id)copyWithZone:(nullable NSZone *)zone {
    Person1 *p = [[Person1 allocWithZone:zone] init];
    return p;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    Person1 *p = [[Person1 allocWithZone:zone] init];
    return p;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self == [super init]) {
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}



//- (id)copy {
//    
//}
//
//- (id)mutableCopy {
//    
//}

@end
