//
//  RCMarvelAPI.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>

#import "RCMarvelAPI.h"
#import "RCAPIOperation.h"
#import "RCRequestKeys.h"

static NSString * const RCMarvelAPIVersionName = @"Cable";

@interface RCMarvelAPI ()

@property (nonatomic, strong) NSOperationQueue *queue;

@property (nonatomic, readonly, strong) NSString *timestamp;
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

#pragma mark - Private methods

- (NSString *)stringFromIdentifier:(NSNumber *)identifier
{
	return identifier ? identifier.stringValue : nil;
}

- (void)validateFilter:(RCFilter *)filter ofType:(RCAPITypes)type
{
	if (filter) {
		return;
	}

	switch (type) {
		case RCAPITypeCharacters:
			filter = [[RCCharacterFilter alloc] init];
		case RCAPITypeEvents:
			filter = [[RCEventFilter alloc] init];
		case RCAPITypeStories:
			filter = [[RCStoryFilter alloc] init];
		default:
			filter = nil;
	}
}

@end
