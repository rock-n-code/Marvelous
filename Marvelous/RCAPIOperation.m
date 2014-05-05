//
//  RCAPIOperation.m
//  Marvelous
//
//  Copyright (c) 2014 Rock & Code [http://rock-n-code.com]
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) RCFilter *filter;
@property (nonatomic, strong) RCDataWrapperObject *data;
@property (nonatomic) RCAPITypes type;

/*!
 @property
 
 This property sets and gets the session object in charge of the communication to an API endpoint.

 @internal
 */
@property (nonatomic, strong) NSURLSession *session;

/*!
 @property

 This property gets the URL object that contains the path to an API endpoint based on the given type, identifier, filter and authentication parameters.

 @internal
 */
@property (nonatomic, readonly, strong) NSURL *requestURL;

/*!
 @property

 This property gets the operation type to execute based on the given type and filter.

 @internal
 */
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
		if (self.callbackBlock) {
			self.callbackBlock(self.data, self.error);
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

		if (self.callbackBlock) {
			self.callbackBlock(self.data, self.error);
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

	if (self.callbackBlock) {
		self.callbackBlock(self.data, self.error);
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

/*!
 @method
 
 This method checks the validity of a given filter. 
 
 In case the filter is not valid, the operation set an error object.
 
 @param filter A filter to validate
 
 @return A boolean value that represent whether the filter is indeed valid
 
 @internal
 */
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

/*!
 @method

 This method checks the validity of a given type and identifier for a resource.
 
 In case the type and/or the identifier are not valid, the operation set an error object.

 @param type A type to validate
 @param identifier An identifier to validate

 @return A boolean value that represent whether the type and identifier are indeed valid

 @internal
 */
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

/*!
 @method

 This method assign a given type, identifier, filter and authentication parameters to its respective properties. 

 In case the given filter is an object, the "parameters" property will contain both the filter parameters and the authentication parameters. Otherwise, this property will contain only the authentication parameters.

 @param type The type of operation to initialise
 @param identifier The identifier to a particular resource to retrieve from an API endpoint
 @param filter A filter that contain the parameters to search on an API endpoint
 @param authentication A dictionary that contains authentication parameters which sign a request to an API endpoint

 @internal
 */
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

/*!
 @method

 This method creates a dictionary out of two given dictionaries.

 @param filterParams A dictionary that contains the filter parameters
 @param authParams A dictionary that contains the authentication parameters

 @return A dictionary containing the filter and authentication parameters

 @internal
 */
- (NSDictionary *)parametersFromFilter:(NSDictionary *)filterParams andAuthentication:(NSDictionary *)authParams
{
	NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

	[parameters addEntriesFromDictionary:filterParams];
	[parameters addEntriesFromDictionary:authParams];

	return parameters;
}

/*!
 @method
 
 This method convert a given type into a string.
 
 @param type The type of operation to convert

 @return A string that represent the given operation type
 
 @internal
*/
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

/*!
 @method

 This method convert a given dictionary containing parameters into a string to be included into a URL request to an API endpoint.
 
 Every value is escaped using UTF-8 encoding and every tuple is joined by the "&" character.

 @param parameters A dictionary containing parameters

 @return A string that represent the given parameters

 @internal
 */
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
