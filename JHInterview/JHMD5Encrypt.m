//
//  JHMD5Encrypt.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/13.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "JHMD5Encrypt.h"

#import <CommonCrypto/CommonDigest.h>

@implementation JHMD5Encrypt


#pragma mark - 32位 小写
+(NSString *)MD5ForLower32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    NSLog(@"32位 小写打印MD5后的加密结果：%@",digest);
    return digest;
}

#pragma mark - 32位 大写
+(NSString *)MD5ForUpper32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    NSLog(@"32位 大写打印MD5后的加密结果：%@",digest);
    return digest;
}

#pragma mark - 16位 大写
+(NSString *)MD5ForUpper16Bate:(NSString *)str{
    
    NSString *md5Str = [self MD5ForUpper32Bate:str];
    
    NSString *digest;
    for (int i=0; i<24; i++) {
        digest=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    NSLog(@"16位 大写打印MD5后的加密结果：%@",digest);
    return digest;
}


#pragma mark - 16位 小写
+(NSString *)MD5ForLower16Bate:(NSString *)str{
    
    NSString *md5Str = [self MD5ForLower32Bate:str];
    
    NSString *digest;
    for (int i=0; i<24; i++) {
        digest=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    NSLog(@"16位 小写打印MD5后的加密结果：%@",digest);
    return digest;
}

@end
