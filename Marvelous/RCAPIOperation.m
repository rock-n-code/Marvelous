//
//  RCAPIOperation.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCAPIOperation.h"

static NSString * const RCAPIOperationContentTypeKey = @"Content-Type";
static NSString * const RCAPIOperationAcceptKey = @"Accept";
static NSString * const RCAPIOperationJSONValue = @"application/json";

@interface RCAPIOperation ()

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSDictionary *filter;
@property (nonatomic, strong) NSDictionary *json;

@end

@implementation RCAPIOperation

#pragma mark - NSObject

- (id)initWithURL:(NSURL *)url andFilter:(NSDictionary *)filter
{
	self = [self init];

	if (self) {
		self.url = url;
		self.filter = filter;
	}

	return self;
}

- (id)init
{
	self = [super init];

	if (self) {
		NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];

		self.session = [NSURLSession sessionWithConfiguration:configuration];
		self.type = RCAPIOperationTypeUndefined;
	}

	return self;
}

#pragma mark - RCOperation

- (void)start
{
	[super start];

	if (!self.url || !self.filter || self.type == RCAPIOperationTypeUndefined) {
		NSString *description;
		NSInteger code;

		if (!self.url) {
			description = RCOperationErrorURLIsNull;
			code = RCOperationErrorCodeURLIsNull;
		} else if (!self.filter) {
			description = RCOperationErrorFilterIsNull;
			code = RCOperationErrorCodeFilterIsNull;
		} else {
			description = RCOperationErrorTypeUndefined;
			code = RCOperationErrorCodeTypeUndefined;
		}

		NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description};

		[self errorWithCode:code andUserInfo:userInfo];

		if (self.jsonCompletion) {
			self.jsonCompletion(self.json, self.error);
		}

		[super finish];

		return;
	}

	if (self.isCancelled) {
		return;
	}

	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url];

	[request setValue:RCAPIOperationJSONValue forHTTPHeaderField:RCAPIOperationContentTypeKey];
	[request setValue:RCAPIOperationJSONValue forHTTPHeaderField:RCAPIOperationAcceptKey];

	NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		if (error) {
			[self errorWithCode:error.code andUserInfo:error.userInfo];
		} else {
			self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

			if (error) {
				[self errorWithCode:error.code andUserInfo:error.userInfo];
			}
		}

		if (self.jsonCompletion) {
			self.jsonCompletion(self.json, self.error);
		}

		[self finish];
	}];


	if (self.isCancelled) {
		return;
	}
	
	[task resume];
}

- (void)cancel
{
	NSDictionary *userInfo = @{NSLocalizedDescriptionKey: RCOperationErrorCancelled};

	[self errorWithCode:RCOperationErrorCodeOperationCancelled andUserInfo:userInfo];

	if (self.jsonCompletion) {
		self.jsonCompletion(self.json, self.error);
	}

	[super cancel];
}

@end
