//
//  RCOperation.m
//  Kashmir
//
//  Created by Javier Cicchelli on 13/02/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCOperation.h"

static NSString * const KVOIsExecutingKey = @"isExecuting";
static NSString * const KVOIsFinishedKey = @"isFinished";

@interface RCOperation ()

@property (nonatomic, strong) NSError *error;

@end

@implementation RCOperation

#pragma mark - NSOperation methods

- (void)main
{
	self.isConcurrent = NO;
    self.isExecuting = YES;
	self.isCancelled = NO;
    self.isFinished = NO;
}

- (void)start
{
	self.isConcurrent = YES;
    self.isExecuting = YES;
	self.isCancelled = NO;
    self.isFinished = NO;
}

- (void)cancel
{
	self.isExecuting = NO;
	self.isCancelled = YES;
	self.isFinished = YES;

	[super cancel];
}

#pragma mark - Properties

- (void)setIsExecuting:(BOOL)isExecuting
{
	[self willChangeValueForKey:KVOIsExecutingKey];

    _isExecuting = isExecuting;

	[self didChangeValueForKey:KVOIsExecutingKey];
}

- (void)setIsFinished:(BOOL)isFinished
{
	[self willChangeValueForKey:KVOIsFinishedKey];

	_isFinished = isFinished;

	[self didChangeValueForKey:KVOIsFinishedKey];
}

#pragma mark - Public methods

- (void)finish
{
	self.isExecuting = NO;
	self.isCancelled = NO;
	self.isFinished = YES;
}

- (void)errorWithCode:(NSInteger)code andUserInfo:(NSDictionary *)userInfo
{
	self.error = [NSError errorWithDomain:NSStringFromClass(self.class) code:code userInfo:userInfo];
}

@end
