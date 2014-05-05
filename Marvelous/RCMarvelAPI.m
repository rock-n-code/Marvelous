//
//  RCMarvelAPI.m
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

#import <CommonCrypto/CommonDigest.h>

#import "RCMarvelAPI.h"
#import "RCAPIOperation.h"
#import "RCRequestKeys.h"

static NSString * const RCMarvelAPIVersionName = @"Cable";

@interface RCMarvelAPI ()

/*!
 @property

 This property sets and gets an operation queue object that handle operation objects that interact with API endpoints.
 
 @internal
 */
@property (nonatomic, strong) NSOperationQueue *queue;

/*!
 @property

 This property gets a timestamp generated at the time of its call.
 
 @internal
 */
@property (nonatomic, readonly, strong) NSString *timestamp;

/*!
 @property

 This property gets a dictionary containing authentication parameters to sign a request to any API endpoint.
 
 @internal
 */
@property (nonatomic, readonly, strong) NSDictionary *authParameters;

@end

@implementation RCMarvelAPI

#pragma mark - NSObject

- (id)init
{
	self = [super init];

	if (self) {
		self.queue = [[NSOperationQueue alloc] init];

		self.queue.name = @"Marvel API Operation Queue";
		self.queue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
	}

	return self;
}

#pragma mark - Class methods

+ (RCMarvelAPI *)api
{
	static dispatch_once_t once;
	static RCMarvelAPI *instance;

	dispatch_once(&once, ^{
		instance = [[self alloc] init];
	});

	return instance;
}

#pragma mark - Properties

- (NSString *)version
{
//	TODO: it should be fetched from the API in the near future.
	return RCMarvelAPIVersionName;
}

- (NSString *)timestamp
{
	return [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]];
}

- (NSDictionary *)authParameters
{
	NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
	NSString *timestamp = self.timestamp;

	parameters[RCRequestKeyTimestamp] = timestamp;

	if (self.publicKey) {
		parameters[RCRequestKeyAPIKey] = self.publicKey;
	}

	if (self.publicKey && self.privateKey) {
		parameters[RCRequestKeyHash] = [self hashFromStrings:@[timestamp, self.privateKey, self.publicKey]];
	}

	return parameters;
}

#pragma mark - Public methods

- (void)characterByIdentifier:(NSNumber *)identifier andCallbackBlock:(resultCallbackBlock)callbackBlock
{
	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:stringfiedIdentifier andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)charactersByFilter:(RCCharacterFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)charactersByComicIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeCharacters];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeComics identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)charactersByEventIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeCharacters];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeEvents identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)charactersBySeriesIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeCharacters];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeSeries identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)charactersByStoryIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeCharacters];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeStories identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicByIdentifier:(NSNumber *)identifier andCallbackBlock:(resultCallbackBlock)callbackBlock
{
	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeComics identifier:stringfiedIdentifier andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicsByFilter:(RCComicsFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicsByCharacterIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeComics];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicsByCreatorIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeComics];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCreators identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicsByEventIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeComics];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeEvents identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicsBySeriesIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeComics];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeSeries identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicsByStoryIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeComics];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeStories identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)creatorByIdentifier:(NSNumber *)identifier andCallbackBlock:(resultCallbackBlock)callbackBlock
{
	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCreators identifier:stringfiedIdentifier andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)creatorsByFilter:(RCCreatorFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)creatorsByComicIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeCreators];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeComics identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)creatorsByEventIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeCreators];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeEvents identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)creatorsBySeriesIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeCreators];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeSeries identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)creatorsByStoryIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeCreators];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeStories identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventByIdentifier:(NSNumber *)identifier andCallbackBlock:(resultCallbackBlock)callbackBlock
{
	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeEvents identifier:stringfiedIdentifier andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventsByFilter:(RCEventFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventsByCharacterIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeEvents];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventsByComicIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeEvents];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeComics identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventsByCreatorIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeEvents];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCreators identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventsBySeriesIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeEvents];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeSeries identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventsByStoryIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeEvents];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeStories identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)seriesByIdentifier:(NSNumber *)identifier andCallbackBlock:(resultCallbackBlock)callbackBlock
{
	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeSeries identifier:stringfiedIdentifier andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)seriesByFilter:(RCSeriesFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)seriesByCharacterIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeSeries];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)seriesByCreatorIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeSeries];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCreators identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)seriesByEventIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeSeries];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeEvents identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)seriesByStoryIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeSeries];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeStories identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storyByIdentifier:(NSNumber *)identifier andCallbackBlock:(resultCallbackBlock)callbackBlock
{
	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeStories identifier:stringfiedIdentifier andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storiesByFilter:(RCStoryFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storiesByCharacterIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeStories];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storiesByComicIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeStories];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeComics identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storiesByCreatorIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeStories];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCreators identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storiesByEventIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeStories];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeEvents identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storiesBySeriesIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock
{
	[self validateFilter:filter ofType:RCAPITypeStories];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeSeries identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.callbackBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCallbackBlock:callbackBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

#pragma mark - Private methods

/*!
 @method

 This instance method convert a list of strings into a MD5 hash.
 
 @param strings A list of strings represented as NSString objects
 
 @return A generated MD5 hash
 
 @internal
 */
- (NSString *)hashFromStrings:(NSArray *)strings
{
	NSMutableString *stringToHash = [NSMutableString string];
	NSMutableString *hashedString = [NSMutableString string];

	[strings enumerateObjectsUsingBlock:^(NSString *string, NSUInteger index, BOOL *stop) {
		[stringToHash appendString:string];
	}];

	const char *pointer = stringToHash.UTF8String;
	unsigned char buffer[CC_MD5_DIGEST_LENGTH];

	CC_MD5(pointer, (int)strlen(pointer), buffer);

	for (int index = 0; index < CC_MD5_DIGEST_LENGTH; index++) {
		[hashedString appendFormat:@"%02x", buffer[index]];
	}

	return hashedString;
}

/*!
 @method

 This instance method convert to string a value contained on a given identifier.
 
 @param identifier An identifier
 
 @return A string in case the given identifier is indeed a NSNumber object.
		 NULL in case the given identifier is NULL

 @internal
 */
- (NSString *)stringFromIdentifier:(NSNumber *)identifier
{
	return identifier ? identifier.stringValue : nil;
}

/*!
 @method

 This instance method check if a given filter is an object or NULL. In case the filter is not an allocated object, then it creates a new instance of RCFilter depending the given type.
 
 @param filter A filter
 @param type A RCAPITypes value
 
 @internal
 */
- (void)validateFilter:(RCFilter *)filter ofType:(RCAPITypes)type
{
	if (!filter) {
		if (type == RCAPITypeCharacters) {
			filter = [[RCCharacterFilter alloc] init];
		} else if (type == RCAPITypeComics) {
			filter = [[RCComicsFilter alloc] init];
		} else if (type == RCAPITypeCreators) {
			filter = [[RCCreatorFilter alloc] init];
		} else if (type == RCAPITypeEvents) {
			filter = [[RCEventFilter alloc] init];
		} else if (type == RCAPITypeSeries) {
			filter = [[RCSeriesFilter alloc] init];
		} else {
			filter = [[RCStoryFilter alloc] init];
		}
	}
}

/*!
 @method

 This instance method prepare the objects to send back to a given callback block. It create a metadata object and get the first object of the "results" property from a given data wrapper object in case the API response doesn't return any error.
 
 @param callbackBlock A callback block
 @param dataWrapper The data received from the API endpoint
 @param error An error retrieved from the API endpoint
 
 @internal
 */
- (void)sendResultToCallbackBlock:(resultCallbackBlock)callbackBlock fromDataWrapper:(RCDataWrapperObject *)dataWrapper andError:(NSError *)error
{
	id result = nil;
	RCQueryInfoObject *info = nil;

	if (!error) {
		info = [[RCQueryInfoObject alloc] initWithDataWrapper:dataWrapper];

		if (dataWrapper.data.results.count > 0) {
			result = dataWrapper.data.results[0];
		}
	}

	callbackBlock(result, info, error);
}

/*!
 @method

 This instance method prepare the objects to send back to a given callback block. It create a metadata object and get the objects of the "results" property from the given data wrapper object in case the API response doesn't return any error.
 
 @param callbackBlock A callback block
 @param dataWrapper The data received from the API endpoint
 @param error An error retrieved from the API endpoint

 @internal
 */
- (void)sendResultsToCallbackBlock:(resultsCallbackBlock)callbackBlock fromDataWrapper:(RCDataWrapperObject *)dataWrapper andError:(NSError *)error
{
	NSArray *results = nil;
	RCQueryInfoObject *info = nil;

	if (!error) {
		info = [[RCQueryInfoObject alloc] initWithDataWrapper:dataWrapper];
		results = dataWrapper.data.results;
	}

	callbackBlock(results, info, error);
}

@end
