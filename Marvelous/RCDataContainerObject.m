//
//  RCDataContainerObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCDataContainerObject.h"
#import "RCCharacterObject.h"
#import "RCComicsObject.h"
#import "RCCreatorObject.h"
#import "RCEventObject.h"
#import "RCSeriesObject.h"
#import "RCStoryObject.h"
#import "RCResponseKeys.h"

@interface RCDataContainerObject ()

@property (nonatomic, strong) NSNumber *offset;
@property (nonatomic, strong) NSNumber *limit;
@property (nonatomic, strong) NSNumber *total;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, strong) NSArray *results;

@end

@implementation RCDataContainerObject

#pragma mark - NSObject

- (id)initWithType:(RCAPITypes)type andDictionary:(NSDictionary *)dictionary
{
	self = [super init];

	if (self) {
		self.offset = dictionary[RCResponseKeyOffset];
		self.limit = dictionary[RCResponseKeyLimit];
		self.total = dictionary[RCResponseKeyTotal];
		self.count = dictionary[RCResponseKeyCount];
		self.results = [self resultsFromArray:dictionary[RCResponseKeyResults] andType:type];
	}

	return self;
}

#pragma mark - Private methods

- (NSArray *)resultsFromArray:(NSArray *)array andType:(RCAPITypes)type
{
	NSMutableArray *results = [NSMutableArray array];

	[array enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger index, BOOL *stop) {
		id result;

		if (type == RCAPITypeCharacters) {
			result = [[RCCharacterObject alloc] initWithDictionary:dictionary];
		} else if (type == RCAPITypeComics) {
			result = [[RCComicsObject alloc] initWithDictionary:dictionary];
		} else if (type == RCAPITypeCreators) {
			result = [[RCCreatorObject alloc] initWithDictionary:dictionary];
		} else if (type == RCAPITypeEvents) {
			result = [[RCEventObject alloc] initWithDictionary:dictionary];
		} else if (type == RCAPITypeSeries) {
			result = [[RCSeriesObject alloc] initWithDictionary:dictionary];
		} else if (type == RCAPITypeStories) {
			result = [[RCStoryObject alloc] initWithDictionary:dictionary];
		}

		[results addObject:result];
	}];

	self.results = results;

	return results;
}

@end
