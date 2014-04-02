//
//  RCAPIOperation.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCAPIOperation.h"
#import "RCRequestKeys.h"
#import "RCResponseKeys.h"
#import "RCStatusCodes.h"

static NSString * const RCAPIOperationBaseURL = @"https://gateway.marvel.com/v1/public/%@?%@";
static NSString * const RCAPIOperationBaseURLIdentifier = @"https://gateway.marvel.com/v1/public/%@/%@?%@";
static NSString * const RCAPIOperationBaseURLIdentifierFilter = @"https://gateway.marvel.com/v1/public/%@/%@/%@?%@";
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
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) RCFilter *filter;
@property (nonatomic, strong) RCDataWrapperObject *data;
@property (nonatomic) RCAPITypes type;

@property (nonatomic, readonly, strong) NSURL *requestURL;
@property (nonatomic, readonly) RCAPITypes typeToConvert;

@end

@implementation RCAPIOperation

#pragma mark - NSObject

- (id)initWithFilter:(RCFilter *)filter andAuthentication:(NSDictionary *)authentication
{
	self = [self init];

	if (self && [self validateFilter:filter]) {
		[self initType:filter.type identifier:nil filter:filter andAuthentication:authentication];
	}

	return self;
}

- (id)initWithType:(RCAPITypes)type identifier:(NSString *)identifier andAuthentication:(NSDictionary *)authentication
{
	self = [self init];

	if (self && [self validateType:type andIdentifier:identifier]) {
		[self initType:type identifier:identifier filter:nil andAuthentication:authentication];
	}

	return self;
}

- (id)initWithType:(RCAPITypes)type identifier:(NSString *)identifier filter:(RCFilter *)filter andAuthentication:(NSDictionary *)authentication
{
	self = [self init];

	if (self && [self validateType:type andIdentifier:identifier] && [self validateFilter:filter]) {
		[self initType:type identifier:identifier filter:filter andAuthentication:authentication];
	}

	return self;
}

- (id)init
{
	self = [super init];

	if (self) {
		NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];

		self.session = [NSURLSession sessionWithConfiguration:configuration];
		self.type = RCAPITypeUndefined;
	}

	return self;
}

#pragma mark - RCOperation

- (void)start
{
	[super start];

	if (self.error) {
		if (self.completionBlock) {
			self.completionBlock(self.data, self.error);
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
			NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

			if (error) {
				[self errorWithCode:error.code andUserInfo:error.userInfo];
			} else {
				NSHTTPURLResponse *http = (NSHTTPURLResponse *)response;

				if (http.statusCode != RCStatusCodeOK) {
					NSString *message = json[RCResponseKeyMessage];

					if (!message) {
						message = json[RCResponseKeyStatus];
					}

					NSDictionary *userInfo = @{NSLocalizedDescriptionKey: message};

					[self errorWithCode:http.statusCode andUserInfo:userInfo];
				} else {
					self.data = [[RCDataWrapperObject alloc] initWithType:self.typeToConvert andDictionary:json];
				}
			}
		}

		if (self.completionBlock) {
			self.completionBlock(self.data, self.error);
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

	if (self.completionBlock) {
		self.completionBlock(self.data, self.error);
	}

	[super cancel];
}

#pragma mark - Properties

- (NSURL *)requestURL
{
	NSString *format = RCAPIOperationBaseURL;
	NSString *type = [self stringFromType:self.type];
	NSString *parameters = [self stringFromParameters:self.parameters];
	NSString *filterType;
	NSString *urlString;

	if (self.identifier) {
		if (self.filter) {
			format = RCAPIOperationBaseURLIdentifierFilter;
			filterType = [self stringFromType:self.filter.type];
			urlString = [NSString stringWithFormat:format, type, self.identifier, filterType, parameters];
		} else {
			format = RCAPIOperationBaseURLIdentifier;
			urlString = [NSString stringWithFormat:format, type, self.identifier, parameters];
		}
	} else {
		urlString = [NSString stringWithFormat:format, type, parameters];
	}

	return [NSURL URLWithString:urlString];
}

- (RCAPITypes)typeToConvert
{
	RCAPITypes type = self.type;

	if (self.filter && self.filter.type != type) {
		type = self.filter.type;
	}

	return type;
}

#pragma mark - Private methods

- (BOOL)validateFilter:(RCFilter *)filter
{
	BOOL isValidated = filter && filter.type != RCAPITypeUndefined;

	if (!isValidated) {
		NSString *description;
		NSInteger code;

		if (!filter) {
			description = RCOperationErrorFilterIsNull;
			code = RCOperationErrorCodeFilterIsNull;
		} else {
			description = RCOperationErrorFilterUndefined;
			code = RCOperationErrorCodeFilterUndefined;
		}

		NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description};

		[self errorWithCode:code andUserInfo:userInfo];
	}

	return isValidated;
}

- (BOOL)validateType:(RCAPITypes)type andIdentifier:(NSString *)identifier
{
	BOOL isValidated = type != RCAPITypeUndefined && identifier;

	if (!isValidated) {
		NSString *description;
		NSInteger code;

		if (!identifier) {
			description = RCOperationErrorIdentifierIsNull;
			code = RCOperationErrorCodeIdentifierIsNull;
		} else {
			description = RCOperationErrorTypeUndefined;
			code = RCOperationErrorCodeTypeUndefined;
		}

		NSDictionary *userInfo = @{NSLocalizedDescriptionKey: description};

		[self errorWithCode:code andUserInfo:userInfo];
	}

	return isValidated;
}

- (void)initType:(RCAPITypes)type identifier:(NSString *)identifier filter:(RCFilter *)filter andAuthentication:(NSDictionary *)authentication
{
	self.type = type;
	self.identifier = identifier;
	self.filter = filter;

	if (filter) {
		self.parameters = [self parametersFromFilter:filter.parameters andAuthentication:authentication];
	} else {
		self.parameters = authentication;
	}

	self.url = self.requestURL;
}

- (NSDictionary *)parametersFromFilter:(NSDictionary *)filterParams andAuthentication:(NSDictionary *)authParams
{
	NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

	[parameters addEntriesFromDictionary:filterParams];
	[parameters addEntriesFromDictionary:authParams];

	return parameters;
}

- (NSString *)stringFromType:(RCAPITypes)type
{
	switch (type) {
		case RCAPITypeCharacters:
			return RCRequestKeyCharacters;
		case RCAPITypeComics:
			return RCRequestKeyComics;
		case RCAPITypeCreators:
			return RCRequestKeyCreators;
		case RCAPITypeEvents:
			return RCRequestKeyEvents;
		case RCAPITypeSeries:
			return RCRequestKeySeries;
		case RCAPITypeStories:
			return RCRequestKeyStories;
		default:
			return [NSString string];
	}
}

- (NSString *)stringFromParameters:(NSDictionary *)parameters
{
	NSMutableArray *params = [NSMutableArray array];

	[self.parameters enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
		NSString *encodedValue = [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSString *parameter = [NSString stringWithFormat:RCAPIOperationURLParameter, key, encodedValue];

		[params addObject:parameter];
	}];

	return [params componentsJoinedByString:@"&"];
}

@end
