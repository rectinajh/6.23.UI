//
//  Manager.m
//  6.23.UI
//
//  Created by rimi on 15/6/23.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "Manager.h"

@implementation Manager


- (void)sendNetworkwithURL:(NSString *)url block:(Block)block
{
    NSLog(@"block调用之前");
    block(@"请求数据完毕");
    NSLog(@"block调用之后");
}

@end
