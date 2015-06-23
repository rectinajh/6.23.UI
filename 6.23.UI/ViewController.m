//
//  ViewController.m
//  6.23.UI
//
//  Created by rimi on 15/6/23.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkingManager.h"

#define APP_KEY @"79396f95d9bf1e813672358f2890cfa7"


@interface ViewController ()<NetWorkingManagerDelegate>

//{
//    NSMutableData * _data;
//}
//
- (IBAction)buttonPressed:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)requestFinished:(id)successObject{
    
    NSLog(@"ViewController类中实现的协议方法：%@",successObject);

}
- (void)requestFail:(id)errorDescription{

}


- (IBAction)buttonPressed:(id)sender {
//    
//    //配置body
    //key = 您申请的KEY&pageindex = 1 & pagesize = 2 &keyword =上海
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"1" forKey:@"pageindex"];
    [dic setObject:@"1" forKey:@"pagesize"];
    [dic setObject:@"上海" forKey:@"keyword"];
    [dic setObject:@"79396f95d9bf1e813672358f2890cfa7" forKey:@"key"];
    
     NetWorkingManager *manager = [[NetWorkingManager alloc]init];
    [manager sendAsynWithPOST:@"http://api2.juheapi.com/xiecheng/senicspot/ticket/search" param:dic success:^(id responseObject) {
        
        NSLog(@"block中的传值数据：%@",responseObject);
        //刷新界面操作
    }];
    
    
//     NetWorkingManager *manager = [[NetWorkingManager alloc]init];
    //    manager.delegate = self;
    //    [manager sendAsynWithPOST:@"http://api2.juheapi.com/xiecheng/senicspot/ticket/search" param:dic];
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    [dic setObject:@"1" forKey:@"pageindex"];
//    [dic setObject:@"1" forKey:@"pagesize"];
//    [dic setObject:@"上海" forKey:@"keyword"];
//    [dic setObject:@"79396f95d9bf1e813672358f2890cfa7" forKey:@"key"];
    
//    NSMutableString *string = [NSMutableString string];
    
//    for (NSString *key in dic) {
//        //key = dic[key]
//        [string appendFormat:@"%@ = %@&",key ,dic[key]];
//    }
//     NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
//    
//    //创建对象
//    NSURL *url = [NSURL URLWithString:@"http://api2.juheapi.com/xiecheng/senicspot/ticket/search"];
//    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
//    //确定request
//    urlRequest.timeoutInterval = 10;
//    urlRequest.HTTPMethod = @"POST";
//    [urlRequest setHTTPBody:data];
//    
//    //发送请求
//    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    

}



//
//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
//{
//    NSLog(@"%@", error.localizedDescription);
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//    NSLog(@"收到请求，开始回复");
//    _data = [[NSMutableData alloc] init];
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    [_data appendData:data];
//}
//
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection
//{
//       NSLog(@"%@", _data);
//    NSError * error = nil;
//    id object = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingMutableLeaves error:&error];
//    
//    if (error) {
//        NSLog(@"%@", error.localizedDescription);
//    }
//     NSLog(@"%@", object);
//}
//


@end
