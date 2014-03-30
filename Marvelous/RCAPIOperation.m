//
//  RCAPIOperation.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCAPIOperation.h"
#import "RCAPIOperationClasses.h"
#import "RCRequestKeys.h"

static NSString * const RCAPIOperationBaseURL = @"https://gateway.marvel.com/v1/public/%@?%@";
static NSString * const RCAPIOperationBaseURLWithIdentifier = @"https://gateway.marvel.com/v1/public/%@/%@?%@";
static NSString * const RCAPIOperationURLParameter = @"%@=%@";

static NSString * const RCAPIOperationContentTypeKey = @"Content-Type";
static NSString * const RCAPIOperationContentEncodingKey = @"Content-Encoding";
static NSString * const RCAPIOperationAcceptKey = @"Accept";

static NSString * const RCAPIOperationContentTypeValue = @"application/json";
static NSString * const RCAPIOperationContentEncodingValue = @"gzip";
static NSString * const RCAPIOperationAcceptValue = @"*/*";

@interface RCAPIOperation ()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *publicKey;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSDictionary *filter;
@property (nonatomic, strong) NSDictionary *json;
@property (nonatomic) RCAPIOperationTypes type;

@property (nonatomic, readonly, strong) NSString *stringfiedType;
@property (nonatomic, readonly, strong) NSString *stringfiedFilter;
@property (nonatomic, readonly) RCAPIOperationTypes typeForClass;

@end

@implementation RCAPIOperation

#pragma mark - NSObject

- (id)initWithType:(RCAPIOperationTypes)type publicKey:(NSString *)publicKey andIdentifier:(NSString *)identifier
{
	self = [self init];

	if (self && [self validateType:type publicKey:publicKey andIdentifier:identifier]) {
		self.type = type;
		self.publicKey = publicKey;
		self.identifier = identifier;
		self.filter = @{RCRequestKeyAPIKey: publicKey};
		self.url = [self generateURL];
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

	if (self.error) {
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

- (RCAPIOperationTypes)typeForClass
{
	NSString *className = NSStringFromClass(self.class);

	if ([className isEqualToString:RCAPIOperationClassCharacters]) {
		return RCAPIOperationTypeCharacters;
	} else if ([className isEqualToString:RCAPIOperationClassComics]) {
		return RCAPIOperationTypeComics;
	} else if ([className isEqualToString:RCAPIOperationClassCreators]) {
		return RCAPIOperationTypeCreators;
	} else if ([className isEqualToString:RCAPIOperationClassEvents]) {
		return RCAPIOperationTypeEvents;
	} else if ([className isEqualToString:RCAPIOperationClassSeries]) {
		return RCAPIOperationTypeSeries;
	} else if ([className isEqualToString:RCAPIOperationClassStories]) {
		return RCAPIOperationTypeStories;
	} else {
		return RCAPIOperationTypeUndefined;
	}
}

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

#pragma mark - Private methods

- (BOOL)validateType:(RCAPIOperationTypes)type publicKey:(NSString *)publicKey andIdentifier:(NSString *)identifier
{
	BOOL isValidated = type != RCAPIOperationTypeUndefined && publicKey && identifier;

	if (!isValidated) {
		NSString *description;
		NSInteger code;

		if (!identifier) {
			description = RCOperationErrorIdentifierIsNull;
			code = RCOperationErrorCodeIdentifierIsNull;
		} else if (!publicKey) {
			description = RCOperationErrorIdentifierIsNull;
			code = RCOperationErrorCodePublicKeyIsNull;
		} else {
			description = RCOperationErrorTypeUndefined;
			code = RCOperationErrorCodeTypeUndefined;
		}

		NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description};

		[self errorWithCode:code andUserInfo:userInfo];
	}

	return isValidated;
}

- (NSURL *)generateURL
{
	NSString *urlString;

	if (self.identifier) {
		urlString = [NSString stringWithFormat:RCAPIOperationBaseURLWithIdentifier, self.stringfiedType, self.identifier, self.stringfiedFilter];
	} else {
		urlString = [NSString stringWithFormat:RCAPIOperationBaseURL, self.stringfiedType, self.stringfiedFilter];
	}

	return [NSURL URLWithString:urlString];
}

@end
