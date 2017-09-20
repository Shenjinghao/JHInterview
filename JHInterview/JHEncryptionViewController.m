//
//  JHEncryptionViewController.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/13.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "JHEncryptionViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import "JHMD5Encrypt.h"
#import "JHAESEncrypt.h"
#import "JHBase64.h"

@interface JHEncryptionViewController ()

@end

@implementation JHEncryptionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self MD5];
    
    [JHMD5Encrypt MD5ForLower32Bate:@"hello world"];
    [JHMD5Encrypt MD5ForUpper32Bate:@"hello world"];
    [JHMD5Encrypt MD5ForLower16Bate:@"hello world"];
    [JHMD5Encrypt MD5ForUpper16Bate:@"hello world"];
    
    NSString *AESStr = [JHAESEncrypt encryptAES:@"hello world" key:@"key"];
    NSLog(@"打印AES后的加密结果：%@",AESStr);
    
    
    NSString *AESStr1 = [JHAESEncrypt aes256_encrypt:@"hello world" Encrypttext:@"sjh"];
    NSLog(@"打印AES后的加密结果：%@",AESStr1);
    NSString *AESStr2 = [JHAESEncrypt aes256_decrypt:@"hello world" Decrypttext:AESStr1];
    NSLog(@"打印AES后的解密结果：%@",AESStr2);
    
    NSString *base64_1 = [JHBase64 base64EncodeString:@"hello world"];
    NSLog(@"打印base64后的加密结果：%@",base64_1);
    
    NSString *base64_2 = [JHBase64 base64DecodeString:base64_1];
    NSLog(@"打印base64后的解密结果：%@",base64_2);
}

- (void)MD5 {
    
    NSString *testString = @"hello world";
    const char *str = [testString UTF8String];
    unsigned char result [CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    NSMutableString *mutableStr = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i ++) {
        [mutableStr appendFormat:@"%02X",result[i]];
    }
    NSLog(@"打印MD5后的加密结果：%@",mutableStr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
