//
//  RCComicsObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCComicsObject.h"
#import "RCTextObject.h"
#import "RCComicDateObject.h"
#import "RCComicPriceObject.h"

@interface RCComicsObject ()

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSNumber *digitalIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *issueNumber;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *variantDescription;
@property (nonatomic, strong) NSDate *lastModified;
@property (nonatomic, strong) NSString *isbn;
@property (nonatomic, strong) NSString *upc;
@property (nonatomic, strong) NSString *diamondCode;
@property (nonatomic, strong) NSString *ean;
@property (nonatomic, strong) NSString *issn;
@property (nonatomic, strong) NSString *format;
@property (nonatomic, strong) NSNumber *pageCount;
@property (nonatomic, strong) NSArray *textObjects;
@property (nonatomic, strong) NSURL *resourceURI;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) RCSummaryObject *series;
@property (nonatomic, strong) NSArray *variants;
@property (nonatomic, strong) NSArray *collections;
@property (nonatomic, strong) NSArray *collectedIssues;
@property (nonatomic, strong) NSArray *dates;
@property (nonatomic, strong) NSArray *prices;
@property (nonatomic, strong) RCImageObject *thumbnail;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) RCListObject *creators;
@property (nonatomic, strong) RCListObject *characters;
@property (nonatomic, strong) RCListObject *stories;
@property (nonatomic, strong) RCListObject *events;

@end

@implementation RCComicsObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];

	if (self) {
		self.identifier = dictionary[RCResponseKeyIdentifier];
		self.digitalIdentifier = dictionary[RCResponseKeyDigitalIdentifier];
		self.title = dictionary[RCResponseKeyTitle];
		self.issueNumber = dictionary[RCResponseKeyIssueNumber];
		self.summary = dictionary[RCResponseKeyDescription];
		self.variantDescription = dictionary[RCResponseKeyVariantDescription];
		self.lastModified = [self dateFromString:dictionary[RCResponseKeyModified]];
		self.isbn = dictionary[RCResponseKeyISBN];
		self.upc = dictionary[RCResponseKeyUPC];
		self.diamondCode = dictionary[RCResponseKeyDiamondCode];
		self.ean = dictionary[RCResponseKeyEAN];
		self.issn = dictionary[RCResponseKeyISSN];
		self.format = dictionary[RCResponseKeyFormat];
		self.pageCount = dictionary[RCResponseKeyPageCount];
		self.textObjects = [self objectsFromArray:dictionary[RCResponseKeyTextObjects] ofClass:[RCTextObject class]];
		self.resourceURI = [NSURL URLWithString:dictionary[RCResponseKeyResourceURI]];
		self.urls = [self urlsFromArray:dictionary[RCResponseKeyURLs]];
		self.series = [[RCSummaryObject alloc] initWithDictionary:dictionary[RCResponseKeySeries]];
		self.variants = [self objectsFromArray:dictionary[RCResponseKeyVariants] ofClass:[RCSummaryObject class]];
		self.collections = [self objectsFromArray:dictionary[RCResponseKeyCollections] ofClass:[RCSummaryObject class]];
		self.collectedIssues = [self objectsFromArray:dictionary[RCResponseKeyCollectedIssues] ofClass:[RCSummaryObject class]];
		self.dates = [self objectsFromArray:dictionary[RCResponseKeyDates] ofClass:[RCComicDateObject class]];
		self.prices = [self objectsFromArray:dictionary[RCResponseKeyPrices] ofClass:[RCComicPriceObject class]];
		self.thumbnail = [[RCImageObject alloc] initWithDictionary:dictionary[RCResponseKeyThumbnail]];
		self.images = [self objectsFromArray:dictionary[RCResponseKeyImages] ofClass:[RCImageObject class]];
		self.creators = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyCreators]];
		self.characters = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyCharacters]];
		self.stories = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyStories]];
		self.events = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyEvents]];
	}

	return self;
}

#pragma mark - Private methods

- (NSArray *)objectsFromArray:(NSArray *)array ofClass:(Class)klass
{
	NSMutableArray *objects = [NSMutableArray array];

	[array enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger index, BOOL *stop) {
		id object = nil;

		if ([klass isSubclassOfClass:[RCTextObject class]]) {
			object = [[RCTextObject alloc] initWithDictionary:dictionary];
		} else if ([klass isSubclassOfClass:[RCSummaryObject class]]) {
			object = [[RCSummaryObject alloc] initWithDictionary:dictionary];
		} else if ([klass isSubclassOfClass:[RCComicDateObject class]]) {
			object = [[RCComicDateObject alloc] initWithDictionary:dictionary];
		} else if ([klass isSubclassOfClass:[RCComicPriceObject class]]) {
			object = [[RCComicPriceObject alloc] initWithDictionary:dictionary];
		} else if ([klass isSubclassOfClass:[RCImageObject class]]) {
			object = [[RCImageObject alloc] initWithDictionary:dictionary];
		}

		[objects addObject:object];
	}];

	return objects;
}

@end
