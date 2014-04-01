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
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) RCDataWrapperObject *data;
@property (nonatomic) RCAPITypes type;

@property (nonatomic, readonly, strong) NSString *stringfiedType;
@property (nonatomic, readonly, strong) NSString *stringfiedParameters;
@property (nonatomic, readonly) RCAPITypes typeToConvert;

@end

@implementation RCAPIOperation

#pragma mark - NSObject

- (id)initWithType:(RCAPITypes)type identifier:(NSString *)identifier andAuthentication:(NSDictionary *)authentication
{
	self = [self init];

	if (self && [self validateType:type andIdentifier:identifier]) {
		self.type = type;
		self.identifier = identifier;
		self.parameters = authentication;
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
					// TODO: Build the results from the JSON data.
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

- (NSString *)stringfiedType
{
	switch (self.type) {
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

- (NSString *)stringfiedParameters
{
	NSMutableArray *parameters = [NSMutableArray array];

	[self.parameters enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
		NSString *encodedValue = [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSString *parameter = [NSString stringWithFormat:RCAPIOperationURLParameter, key, encodedValue];

		[parameters addObject:parameter];
	}];

	return [parameters componentsJoinedByString:@"&"];
}

- (RCAPITypes)typeToConvert
{
//	TODO: return the type for a given filter, if any.
	return self.type;
}

#pragma mark - Private methods

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

- (NSURL *)generateURL
{
	NSString *urlString;

	if (self.identifier) {
		urlString = [NSString stringWithFormat:RCAPIOperationBaseURLWithIdentifier, self.stringfiedType, self.identifier, self.stringfiedParameters];
	} else {
		urlString = [NSString stringWithFormat:RCAPIOperationBaseURL, self.stringfiedType, self.stringfiedParameters];
	}

	return [NSURL URLWithString:urlString];
}

@end
