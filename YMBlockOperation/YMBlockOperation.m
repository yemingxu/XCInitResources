//
//  YMBlockOperation.m
//  YMDemoApp
//
//  Created by JoeXu on 2018/5/7.
//  Copyright © 2018年 JoeXu. All rights reserved.
//

#import "YMBlockOperation.h"

@interface YMBlockOperation()
{
    void(^_block)(YMBlockOperation *operation);
}
@property (assign, nonatomic, getter = isExecuting) BOOL executing;
@property (assign, nonatomic, getter = isFinished) BOOL finished;
@end
@implementation YMBlockOperation
@synthesize executing = _executing;
@synthesize finished = _finished;
- (instancetype)initWithBlock:(void(^)(YMBlockOperation *operation))block
{
    if (!(self = [super init])) return self;
    _block = block;
    return self;
}
+ (instancetype)opertionWithBlock:(void(^)(YMBlockOperation *operation))block
{
    return [[self alloc] initWithBlock:block];
}



- (void)main
{
    if ([self isCancelled]){return; }
    
    if (_block){
        _block(self);
    }
    
    if (self.isFinished){
        return;
    }
}

- (void)finish
{
    self.executing = NO;
    self.finished = YES;
}
- (void)cancel
{
    [super cancel];
    [self finish];
}

#pragma mark - 私有
- (void)setExecuting:(BOOL)executing
{
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}
- (void)setFinished:(BOOL)finished
{
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}
@end
