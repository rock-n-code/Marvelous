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
 @property queue
 This property sets and gets the @p NSOperationQueue object that handle the @p RCAPIOperation objects which represents call to the API.
 @internal
 */
@property (nonatomic, strong) NSOperationQueue *queue;

/*!
 @property timestamp
 This property gets a @p NSString object that represent the timestamp generated at the time of its call.
 @internal
 */
@property (nonatomic, readonly, strong) NSString *timestamp;

/*!
 @property authParameters
 This property gets a @p NSDictionary object with the authentication parameters to sign any API call.
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

- (void)characterByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock
{
	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:stringfiedIdentifier andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)charactersByFilter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)charactersByComicIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeCharacters];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeComics identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)charactersByEventIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeCharacters];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeEvents identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)charactersBySeriesIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeCharacters];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeSeries identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)charactersByStoryIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeCharacters];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeStories identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock
{
	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeComics identifier:stringfiedIdentifier andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicsByFilter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicsByCharacterIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeComics];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicsByCreatorIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeComics];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCreators identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicsByEventIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeComics];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeEvents identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicsBySeriesIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeComics];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeSeries identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)comicsByStoryIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeComics];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeStories identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)creatorByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock
{
	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCreators identifier:stringfiedIdentifier andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)creatorsByFilter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)creatorsByComicIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeCreators];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeComics identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)creatorsByEventIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeCreators];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeEvents identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)creatorsBySeriesIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeCreators];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeSeries identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)creatorsByStoryIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeCreators];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeStories identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock
{
	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeEvents identifier:stringfiedIdentifier andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventsByFilter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventsByCharacterIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeEvents];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventsByComicIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeEvents];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeComics identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventsByCreatorIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeEvents];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCreators identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventsBySeriesIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeEvents];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeSeries identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)eventsByStoryIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeEvents];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeStories identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)seriesByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock
{
	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeSeries identifier:stringfiedIdentifier andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)seriesByFilter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)seriesByCharacterIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeSeries];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)seriesByCreatorIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeSeries];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCreators identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)seriesByEventIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeSeries];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeEvents identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)seriesByStoryIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeSeries];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeStories identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storyByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock
{
	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeStories identifier:stringfiedIdentifier andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storiesByFilter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storiesByCharacterIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeStories];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storiesByComicIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeStories];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeComics identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storiesByCreatorIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeStories];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCreators identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storiesByEventIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeStories];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeEvents identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

- (void)storiesBySeriesIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	[self validateFilter:filter ofType:RCAPITypeStories];

	NSString *stringfiedIdentifier = [self stringFromIdentifier:identifier];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeSeries identifier:stringfiedIdentifier filter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		[self sendResultsToCompletionBlock:completionBlock fromDataWrapper:dataWrapper andError:error];
	};

	[self.queue addOperation:operation];
}

#pragma mark - Private methods

/*!
 This instance method convert a list of strings into a MD5 hash.
 @param strings A list of @p NSString objects
 @return A MD5 hash as a @p NSString object
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
 This instance method convert to string a value contained on a @p NSNumber object.
 @param strings A @p NSNumber object
 @return A @p NSString object in case the given parameter is indeed a @p NSNumber object. 
		 NULL in case the given parameter is NULL
 @internal
 */
- (NSString *)stringFromIdentifier:(NSNumber *)identifier
{
	return identifier ? identifier.stringValue : nil;
}

/*!
 This instance method check if a given filter is an object or NULL. In case the filter is not an allocated object, then it creates a new instance of @p RCFilter depending the given type.
 @param filter A @p RCFilter object
 @param type A @RCAPITypes enumeration
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
 This instance method prepare the objects to send back to a @p resultCompletionBlock callback. It create a @p RCQueryInfoObject object and get the first object of the "results" property from a @p RCDataWrapperObject object in case the API response don't return any error.
 @param completionBlock A @p resultCompletionBlock block that is used as the callback
 @param dataWrapper A @p RCDataWrapperObject object containing the data retrieved from an API call
 @param error A @p NSError object that contain the error data retrieved from an API call
 @internal
 */
- (void)sendResultToCompletionBlock:(resultCompletionBlock)completionBlock fromDataWrapper:(RCDataWrapperObject *)dataWrapper andError:(NSError *)error
{
	id result = nil;
	RCQueryInfoObject *info = nil;

	if (!error) {
		info = [[RCQueryInfoObject alloc] initWithDataWrapper:dataWrapper];

		if (dataWrapper.data.results.count > 0) {
			result = dataWrapper.data.results[0];
		}
	}

	completionBlock(result, info, error);
}

/*!
 This instance method prepare the objects to send back to a @p resultsCompletionBlock callback. It create a @p RCQueryInfoObject object and get the objects of the "results" property from a @p RCDataWrapperObject object in case the API response don't return any error.
 @param completionBlock A @p resultsCompletionBlock block that is used as the callback
 @param dataWrapper A @p RCDataWrapperObject object containing the data retrieved from an API call
 @param error A @p NSError object that contain the error data retrieved from an API call
 @internal
 */
- (void)sendResultsToCompletionBlock:(resultsCompletionBlock)completionBlock fromDataWrapper:(RCDataWrapperObject *)dataWrapper andError:(NSError *)error
{
	NSArray *results = nil;
	RCQueryInfoObject *info = nil;

	if (!error) {
		info = [[RCQueryInfoObject alloc] initWithDataWrapper:dataWrapper];
		results = dataWrapper.data.results;
	}

	completionBlock(results, info, error);
}

@end
