//
//  JHAESEncrypt.h
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/13.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHAESEncrypt : NSObject
+ (NSString *)encryptAES:(NSString *)content key:(NSString *)key;

+(NSData *)AES256ParmEncryptWithKey:(NSString *)key Encrypttext:(NSData *)text;   //加密
+(NSData *)AES256ParmDecryptWithKey:(NSString *)key Decrypttext:(NSData *)text;   //解密
+(NSString *) aes256_encrypt:(NSString *)key Encrypttext:(NSString *)text;
+(NSString *) aes256_decrypt:(NSString *)key Decrypttext:(NSString *)text;
@end
