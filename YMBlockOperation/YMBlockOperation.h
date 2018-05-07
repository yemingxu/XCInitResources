//
//  YMBlockOperation.h
//  YMDemoApp
//
//  Created by JoeXu on 2018/5/7.
//  Copyright © 2018年 JoeXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YMBlockOperation : NSOperation
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithBlock:(void(^)(YMBlockOperation *operation))block;
+ (instancetype)opertionWithBlock:(void(^)(YMBlockOperation *operation))block;

- (void)finish;

@end
