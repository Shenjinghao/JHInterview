//
//  JHMD5Encrypt.h
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/13.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHMD5Encrypt : NSObject

/*
 *由于MD5加密是不可逆的,多用来进行验证
 16位的只是截取了中间的几位
 */
// 32位小写
+(NSString *)MD5ForLower32Bate:(NSString *)str;
// 32位大写
+(NSString *)MD5ForUpper32Bate:(NSString *)str;
// 16为大写
+(NSString *)MD5ForUpper16Bate:(NSString *)str;
// 16位小写
+(NSString *)MD5ForLower16Bate:(NSString *)str;


@end
