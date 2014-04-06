//
//  RCSeriesObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCSeriesObject.h"

@interface RCSeriesObject ()

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSURL *resourceURI;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) NSNumber *startYear;
@property (nonatomic, strong) NSNumber *endYear;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSDate *lastModified;
@property (nonatomic, strong) RCImageObject *thumbnail;
@property (nonatomic, strong) RCListObject *comics;
@property (nonatomic, strong) RCListObject *stories;
@property (nonatomic, strong) RCListObject *events;
@property (nonatomic, strong) RCListObject *characters;
@property (nonatomic, strong) RCListObject *creators;
@property (nonatomic, strong) RCSummaryObject *previous;
@property (nonatomic, strong) RCSummaryObject *next;

@end

@implementation RCSeriesObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];

	if (self) {
		self.identifier = dictionary[RCResponseKeyIdentifier];
		self.title = dictionary[RCResponseKeyTitle];
		self.summary = dictionary[RCResponseKeyDescription];
		self.resourceURI = [NSURL URLWithString:dictionary[RCResponseKeyResourceURI]];
		self.urls = [self urlsFromArray:dictionary[RCResponseKeyURLs]];
		self.startYear = dictionary[RCResponseKeyStartYear];
		self.endYear = dictionary[RCResponseKeyEndYear];
		self.rating = dictionary[RCResponseKeyRating];
		self.lastModified = [self dateFromString:dictionary[RCResponseKeyModified]];
		self.thumbnail = [[RCImageObject alloc] initWithDictionary:dictionary[RCResponseKeyThumbnail]];
		self.comics = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyComics]];
		self.stories = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyStories]];
		self.events = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyEvents]];
		self.characters = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyCharacters]];
		self.creators = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyCreators]];
		self.previous = [[RCSummaryObject alloc] initWithDictionary:dictionary[RCResponseKeyPrevious]];
		self.next = [[RCSummaryObject alloc] initWithDictionary:dictionary[RCResponseKeyNext]];
	}

	return self;
}

@end
