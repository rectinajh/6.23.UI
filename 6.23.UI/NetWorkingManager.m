//
//  NetWorkingManager.m
//  6.23.UI
//
//  Created by rimi on 15/6/23.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "NetWorkingManager.h"

#import "Manager.h"


@interface NetWorkingManager ()<NSURLConnectionDelegate>


{
    NSMutableData * _data;
}

//
@property(nonatomic, copy)Block success;

@end

@implementation NetWorkingManager


- (void)sendAsynWithPOST:(NSString *)urlString
                   param:(NSMutableDictionary *)dictionary
{

    NSMutableString *bodystring = [NSMutableString string];
    for (NSString *key in dictionary) {
        //key = dic[key]
        [bodystring appendFormat:@"%@=%@&",key ,dictionary[key]];
    }
    
    NSData *data = [bodystring dataUsingEncoding:NSUTF8StringEncoding];
    //创建对象
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    //确定request
    urlRequest.HTTPMethod = @"POST";
    [urlRequest setHTTPBody:data];
    
    //发送请求
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
#pragma mark - block调用
    Manager *manager = [[Manager alloc]init];
    [manager sendNetworkwithURL:@"" block:^(id object) {
        NSLog(@"%@",object);
    }];
}

#pragma mark - 封装成BLOCK
- (void)sendAsynWithPOST:(NSString *)urlString
                   param:(NSDictionary *)dictionary
                 success:(Block)successBlock
{
    
    NSMutableString *string = [NSMutableString string];
    for (NSString *key in dictionary) {
        //key = dic[key]
        [string appendFormat:@"%@=%@&",key ,dictionary[key]];
    }
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    //创建对象
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    //确定request
    urlRequest.timeoutInterval = 10;
    urlRequest.HTTPMethod = @"POST";
    [urlRequest setHTTPBody:data];
    
    //发送请求
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
    //记录block
    self.success = successBlock;

}

#pragma mark -- 四个协议 正式协议protocol（类名加delegate），非正式协议，创建多个协议只是占用代码区的内存
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error.localizedDescription);
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"收到请求，开始回复");
    _data = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //NSLog(@"%@", _data);
    NSError * error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingMutableLeaves error:&error];
    
    if (error) {
        NSLog(@"%@", error.localizedDescription);
    }
   //NSLog(@"%@", object);
    
    //使用代理传值
    //判断delegate对象存在，方法实现
//    if (_delegate && [_delegate respondsToSelector:@selector(requestFinished:)]) {
//        
//        [_delegate requestFinished:object];
//    }
    //使用block传值
    self.success(object);
    
}

@end
