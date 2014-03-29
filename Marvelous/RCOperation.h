//
//  RCOperation.h
//  Kashmir
//
//  Created by Javier Cicchelli on 13/02/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCOperationErrors.h"
#import "RCOperationErrorCodes.h"

@interface RCOperation : NSOperation

@property (nonatomic) BOOL isConcurrent;
@property (nonatomic) BOOL isExecuting;
@property (nonatomic) BOOL isCancelled;
@property (nonatomic) BOOL isFinished;

@property (nonatomic, strong, readonly) NSError *error;

- (void)main;
- (void)start;
- (void)cancel;
- (void)finish;

- (void)errorWithCode:(NSInteger)code andUserInfo:(NSDictionary *)userInfo;

@end
