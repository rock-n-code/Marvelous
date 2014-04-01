//
//  RCListObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCListObject.h"
#import "RCSummaryObject.h"

@interface RCListObject ()

@property (nonatomic, strong) NSNumber *available;
@property (nonatomic, strong) NSNumber *returned;
@property (nonatomic, strong) NSURL *collectionURI;
@property (nonatomic, strong) NSArray *items;

@end

@implementation RCListObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];

	if (self) {
		self.available = dictionary[RCResponseKeyAvailable];
		self.returned = dictionary[RCResponseKeyReturned];
		self.collectionURI = [NSURL URLWithString:dictionary[RCResponseKeyCollectionURI]];
		self.items = [self itemsFromArray:dictionary[RCResponseKeyItems]];
	}

	return self;
}

#pragma mark - Private methods

- (NSArray *)itemsFromArray:(NSArray *)array
{
	NSMutableArray *items = [NSMutableArray array];

	[array enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger index, BOOL *stop) {
		RCSummaryObject *summary = [[RCSummaryObject alloc] initWithDictionary:dictionary];

		[items addObject:summary];
	}];

	return items;
}

@end
