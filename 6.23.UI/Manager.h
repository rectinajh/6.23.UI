//
//  Manager.h
//  6.23.UI
//
//  Created by rimi on 15/6/23.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Block) (id object);

@interface Manager : NSObject


//- (void)sendNetworkwithURL:(NSString *)url
//                     block:(void(^)(id object))block;

- (void)sendNetworkwithURL:(NSString *)url block:(Block)block;

@end
