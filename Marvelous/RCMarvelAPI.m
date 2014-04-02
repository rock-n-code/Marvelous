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

- (void)getCharactersByFilter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		NSArray *results = nil;
		RCQueryInfoObject *info = nil;

		if (!error) {
			info = [[RCQueryInfoObject alloc] initWithDataWrapper:dataWrapper];

			if (dataWrapper.data.results.count > 0) {
				results = dataWrapper.data.results;
			}
		}

		completionBlock(results, info, error);
	};

	[self.queue addOperation:operation];
}

- (void)getCharacterByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:identifier.stringValue andAuthentication:self.authParameters];

	operation.completionBlock = ^(RCDataWrapperObject *dataWrapper, NSError *error) {
		RCCharacterObject *character = nil;
		RCQueryInfoObject *info = nil;

		if (!error) {
			info = [[RCQueryInfoObject alloc] initWithDataWrapper:dataWrapper];

			if (dataWrapper.data.results.count > 0) {
				character = dataWrapper.data.results[0];
			}
		}

		completionBlock(character, info, error);
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

@end
