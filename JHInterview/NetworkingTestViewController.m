//
//  NetworkingTestViewController.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/15.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "NetworkingTestViewController.h"

@interface NetworkingTestViewController ()

@end

@implementation NetworkingTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self connectionGETSyncNetworkingTest];
}

- (void)connectionGETSyncNetworkingTest {
    // 1.创建URL@"http://www.cnblogs.com/soley/p/5483673.html"
    NSURL *url = [NSURL URLWithString:GET_URL];
    // 2.根据url创建具体的请求(使用缓存策略)
    // 参数1：统一资源定位符 url
    // 参数2：缓存策略 （枚举值）
    /*
     //NSURLRequestUseProtocolCachePolicy//（基础策略）
     
     //NSURLRequestReloadIgnoringLocalCacheData//（忽略本地缓存）
     
     //NSURLRequestReturnCacheDataElseLoad//（首先使用缓存，如果没有本地缓存，才从原地址下载）
     
     //NSURLRequestReturnCacheDataDontLoad//（使用本地缓存，从不下载，如果本地没有缓存，则请求失败，此策略多用于离线操作） www.2cto.com
     
     //NSURLRequestReloadIgnoringLocalAndRemoteCacheData//（无视任何缓存策略，无论是本地的还是远程的，总是从原地址重新下载）
     
     //NSURLRequestReloadRevalidatingCacheData//（如果本地缓存是有效的则不下载，其他任何情况都从原地址重新下载）
     NSURLRequestReloadIgnoringCacheData = NSURLRequestReloadIgnoringLocalCacheData,优先使用本地缓存，如果没有从网络加载（不论有效无效）
     */
    // 参数3：设置延迟时间，如果超时请求终止
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:20];
    
    // 3.连接服务器 [NSURLConnection在iOS9之后已经被弃用]
    // 参数1：请求对象
    // 参数2：存储一些网络请求的信息（一般为包体）一般为nil
    // 参数3：错误信息
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // 4.进行json数据解析
    id resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"connectionNetworkingTest resultDict = %@",resultDict);
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
