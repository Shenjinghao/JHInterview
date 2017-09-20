//
//  ReverseString.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/11.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "ReverseString.h"

@implementation ReverseString


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self reverseStr];
    }
    return self;
}



- (void)reverseStr {
    char string[] = {
        " hello world "
    };
    int length = strlen(string);
    reverseAnother(string,length);
    printf("\n字符串翻转后的字符串   %s\n",string);
}

@end
