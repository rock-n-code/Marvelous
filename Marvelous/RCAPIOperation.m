//
//  RCAPIOperation.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCAPIOperation.h"

static NSString * const RCAPIOperationContentTypeKey = @"Content-Type";
static NSString * const RCAPIOperationContentEncodingKey = @"Content-Encoding";
static NSString * const RCAPIOperationAcceptKey = @"Accept";

static NSString * const RCAPIOperationContentTypeValue = @"application/json";
static NSString * const RCAPIOperationContentEncodingValue = @"gzip";
static NSString * const RCAPIOperationAcceptValue = @"*/*";

@interface RCAPIOperation ()

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *publicKey;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSDictionary *filter;
@property (nonatomic, strong) NSDictionary *json;

@property (nonatomic, strong, readonly) NSString *stringfiedType;
@property (nonatomic, strong, readonly) NSString *stringfiedFilter;

@end

@implementation RCAPIOperation

#pragma mark - NSObject

- (id)initWithType:(RCAPIOperationTypes)type withPublicKey:(NSString *)publicKey andIdentifier:(NSString *)identifier
{
	self = [self init];

	if (self) {
		self.type = type;
		self.publicKey = publicKey;
		self.identifier = identifier;
		self.filter = @{RCRequestKeyAPIKey: publicKey};
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

	[request setValue:RCAPIOperationContentTypeValue forHTTPHeaderField:RCAPIOperationContentTypeKey];
	[request setValue:RCAPIOperationContentEncodingValue forHTTPHeaderField:RCAPIOperationContentEncodingKey];
	[request setValue:RCAPIOperationAcceptValue forHTTPHeaderField:RCAPIOperationAcceptKey];

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

#pragma mark - Properties

- (NSString *)stringfiedType
{
	switch (self.type) {
		case RCAPIOperationTypeCharacters:
			return RCRequestKeyCharacters;
		case RCAPIOperationTypeComics:
			return RCRequestKeyComics;
		case RCAPIOperationTypeCreators:
			return RCRequestKeyCreators;
		case RCAPIOperationTypeEvents:
			return RCRequestKeyEvents;
		case RCAPIOperationTypeSeries:
			return RCRequestKeySeries;
		case RCAPIOperationTypeStories:
			return RCRequestKeyStories;
		default:
			return [NSString string];
	}
}

- (NSString *)stringfiedFilter
{
	NSMutableArray *parameters = [NSMutableArray array];

	[self.filter enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
		NSString *encodedValue = [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSString *parameter = [NSString stringWithFormat:RCAPIOperationURLParameter, key, encodedValue];

		[parameters addObject:parameter];
	}];

	return [parameters componentsJoinedByString:@"&"];
}

@end
