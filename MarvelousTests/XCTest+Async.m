//
//  XCTest+Async.m
//  Fireball
//
//  Created by Javier Cicchelli on 12/02/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "XCTest+Async.h"

@interface XCTest ()

@end

@implementation XCTest (Async)

#pragma mark - Public methods

- (void)runAsynchronousBlock:(void (^)(stopExecution stop))executionBlock
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    executionBlock(^{
        dispatch_semaphore_signal(semaphore);
    });

    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
}

@end
