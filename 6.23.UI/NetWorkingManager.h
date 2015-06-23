//
//  NetWorkingManager.h
//  6.23.UI
//
//  Created by rimi on 15/6/23.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Block)(id responseObject);

@protocol  NetWorkingManagerDelegate<NSObject>

- (void)requestFinished:(id)successObject;
- (void)requestFail:(id)errorDescription;

@end

@interface NetWorkingManager : NSObject

//为什么delegate对象用weak？（手动管理下，避免循环引用）为什么用id？（签订协议的人不同）assign与weak？（arc模式下用weak）
@property (nonatomic ,weak) id<NetWorkingManagerDelegate>  delegate;

- (void)sendAsynWithPOST:(NSString *)urlString
                   param:(NSMutableDictionary *)dictionary;
//封装成BLOCK
- (void)sendAsynWithPOST:(NSString *)urlString
                   param:(NSMutableDictionary *)dictionary
                 success:(Block)successBlock;

@end
