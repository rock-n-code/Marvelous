//
//  XCTest+Async.h
//  Fireball
//
//  Created by Javier Cicchelli on 12/02/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

typedef void (^stopExecution)();

@interface XCTest (Async)

- (void)runAsynchronousBlock:(void (^)(stopExecution stop))executionBlock;

@end
