//
//  NetworkingTestViewController.m
//  JHInterview
//
//  Created by Shenjinghao on 2017/9/15.
//  Copyright © 2017年 jinghao shen. All rights reserved.
//

#import "NetworkingTestViewController.h"

@interface NetworkingTestViewController ()<NSURLConnectionDelegate,NSURLConnectionDataDelegate, NSURLSessionDelegate,NSURLSessionDataDelegate,NSURLSessionTaskDelegate, NSURLSessionDownloadDelegate,NSURLSessionStreamDelegate>

@property (nonatomic, strong) NSMutableData *resultData;

@end

@implementation NetworkingTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*网络请求需要如下设置
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    //同步请求的方式
    [self connectionGETSyncNetworkingTest];
    
    [self connectionPOSTSyncNetworkingTest];
    
    //异步请求的方式  get是代理的方式
    [self connectionGETDelegateNetworkingTest];
    
    [self connectionPOSTAsyncNetworkingTest];
    
    /*
     iOS7之后请求变化
     
     　　1、NSURLSession：
     
     在WWDC 2013中，Apple的团队对NSURLConnection进行了重构，并推出了NSURLSession作为替代。
     支持后台运行的网络任务
     暂停、停止、重启网络任务，不再需要 NSOpation 封装
     请求可以使用同样的配置容器
     不同的 session 可以使用不同的私有存储,block和代理可以同时起作用
     直接从文件系统上传、下载
     为了方便程序员使用，苹果提供了一个全局 session
     所有的 任务(Task) 都是由 Session 发起的
     所有的任务默认是挂起的，需要 Resume
     */
    
    [self sessionGetBlockNetworkingTest];
    
    [self sessionGetDelegateNetworkingTest];
    
    [self sessionPOSTBlockNetworkingTest];
    
    [self sessionPOSTDelegateNetworkingTest];
    
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

- (void)connectionPOSTSyncNetworkingTest {
    // 1.创建URL(post网站打开是不全的)
    NSURL *url = [NSURL URLWithString:POST_URL];
    // 2.根据url创建网络请求（post请求必须初始化为可变请求，因为稍后要进行一些内容的设置）
    NSMutableURLRequest *mRequest = [NSMutableURLRequest requestWithURL:url];
    // 设置body
    // 创建一个连接字符串（这个内容在以后的开发中接口文档都有标注）
    NSString *dataString = POST_BODY;
    // 对连接字符串进行编码
    NSData *postData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    // 设置请求格式为POST请求(必须大写)
    [mRequest setHTTPMethod:@"POST"];
    // 设置请求体(body)
    [mRequest setHTTPBody:postData];
    // 3.连接服务器
    NSData *data = [NSURLConnection sendSynchronousRequest:mRequest returningResponse:nil error:nil];
    // 4.进行json数据解析
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"dic = %@",dic);
}

- (void)connectionGETDelegateNetworkingTest {
    // 1.创建URL
    NSURL *url = [NSURL URLWithString:GET_URL];
    // 2.创建网络请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark - NSRULConnectionDataDelegate相关的代理方法
// 服务器开始响应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.resultData = [NSMutableData data];
}
// 开始接收数据
// 这个方法会重复执行，得到的每段数据拼接在一起就可以了
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //如果此时的resultData是用copy修饰，会出现crash  找不到方法的错误✨singl 6错误
    /*
     '-[_NSZeroData appendData:]: unrecognized selector sent to instance 0x6000000138a0'
     因为此时用copy修饰的属性是_NSZeroData实例对象，
     用strong修饰的属性实例化后的是NSConcreteMutableData
     */
    [self.resultData appendData:data];
}
// 结束服务器
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // 进行数据解析
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.resultData options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@", dict);
}

- (void)connectionPOSTAsyncNetworkingTest {
    // 1.创建url
    NSURL *url = [NSURL URLWithString:POST_URL];
    // 2.获取网络请求
    NSMutableURLRequest *mRequest = [NSMutableURLRequest requestWithURL:url];
    // 设置连接字符串
    NSString *dataString = POST_BODY;
    // 转换格式
    NSData *postData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    // 设置请求类型
    [mRequest setHTTPMethod:@"POST"];
    // 设置请求体
    [mRequest setHTTPBody:postData];
    
    // 3.连接服务器
    [NSURLConnection sendAsynchronousRequest:mRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        // 解析数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@",dict);
    }];

}

- (void)sessionGetBlockNetworkingTest {
    // 方式一：使用block实现
    // 创建url
    NSURL *url = [NSURL URLWithString:GET_URL];
    // 创建NSURLSession对象
    NSURLSession *session = [NSURLSession sharedSession];
    // 创建task请求任务，通过URL初始化task，在block内部可以直接对返回的数据进行处理
    // NSURLSession是基于任务去完成相关的事件的
    // NSURLSessionTask所有的任务均放在这个里边实现
    // 对数据进行加载：使用NSURLSessionDataTask和NSURLSessionTask两者没有本质区别
    // 要处理下载任务的时候使用此任务：NSURLSessionDownloadTask
    // 要处理上传任务使用：NSURLSessionUploadTask
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 解析数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@", dict);
    }];
    // 启动任务(NSURLSessionTask实例出来的任务处于挂起状态，如果不启动，不会走block中的实现内容)
    [task resume];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@", dict);
    }];
    [dataTask resume];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 注意这里将NSURLResponse对象转换成NSHTTPURLResponse对象才能看属性值
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSDictionary *dict = [httpResponse allHeaderFields];
        NSLog(@"%@", dict);
    }];
    [downloadTask resume];
    
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:[NSURLRequest requestWithURL:url] fromData:nil completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSDictionary *dict = [httpResponse allHeaderFields];
        NSLog(@"%@", dict);
    }];
    [uploadTask resume];
}

- (void)sessionGetDelegateNetworkingTest {
    /*
     NSURLSessionDelegate - 定义代理方法以处理会话级事件
     NSURLSessionTaskDelegate - 处理所有任务类型通用的任务级事件
     NSURLSessionDataDelegate - 定义委托方法来处理特定于数据和上传任务的任务级事件
     NSURLSessionDownloadDelegate - 定义委托方法以处理特定于下载任务的任务级事件
     NSURLSessionStreamDelegate - 定义委托方法以处理特定于'stream'任务的任务级事件
     */
    NSURL *url = [NSURL URLWithString:GET_URL];
    // 创建session
    // 参数1：模式的设置（默认会话模式（default），瞬时会话模式（ephemeral），后台会话模式（background））
    // 参数2：代理
    // 参数3：主线程队列
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    // 创建task任务
    NSURLSessionDataTask *task = [session dataTaskWithURL:url];
    [task resume];
}

#pragma mark - NSURLSessionDataDelegate协议的实现方法
// 接受服务器响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    // 允许服务器响应(只有允许了才会接受到数据)
    completionHandler(NSURLSessionResponseAllow);
    // 当网络请求是基于http协议时（url以http开头），response本质为NSHTTPURLResponse（可写可不写）
    //    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    //初始化data，稍后进行片段的拼接存储
    self.resultData = [NSMutableData data];
    
}

// 接受数据拼接
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    // 反复执行，然后拼接相关的片段
    [_resultData appendData:data];
}

// 数据接受完成，网络请求结束
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    // 解析
    if (error == nil) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self.resultData options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@", dic);
    }
}
- (void)sessionPOSTBlockNetworkingTest {
    // 创建url
    NSURL *url = [NSURL URLWithString:POST_URL];
    // 创建请求
    NSMutableURLRequest *mRequest = [NSMutableURLRequest requestWithURL:url];
    [mRequest setHTTPMethod:@"POST"];
    [mRequest setHTTPBody:[POST_BODY dataUsingEncoding:NSUTF8StringEncoding]];
    // 通过request初始化task
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:mRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"%@", dict);
    }];
    [task resume];
}
- (void)sessionPOSTDelegateNetworkingTest {
    NSURL *url = [NSURL URLWithString:POST_URL];
    // 创建session
    // 参数1：模式的设置（默认会话模式（default），瞬时会话模式（ephemeral），后台会话模式（background））
    // 参数2：代理
    // 参数3：主线程队列
    NSMutableURLRequest *mRequest = [NSMutableURLRequest requestWithURL:url];
    [mRequest setHTTPMethod:@"POST"];
    [mRequest setHTTPBody:[POST_BODY dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    // 创建task任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:mRequest];
    [task resume];
    // 协议部分与GET相同
}

@end
