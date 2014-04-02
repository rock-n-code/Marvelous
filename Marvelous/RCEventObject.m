//
//  RCEventObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 02/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCEventObject.h"

@interface RCEventObject ()

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSURL *resourceURI;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) NSDate *lastModified;
@property (nonatomic, strong) NSDate *start;
@property (nonatomic, strong) NSDate *end;
@property (nonatomic, strong) RCImageObject *thumbnail;
@property (nonatomic, strong) RCListObject *comics;
@property (nonatomic, strong) RCListObject *stories;
@property (nonatomic, strong) RCListObject *series;
@property (nonatomic, strong) RCListObject *characters;
@property (nonatomic, strong) RCListObject *creators;
@property (nonatomic, strong) RCSummaryObject *previous;
@property (nonatomic, strong) RCSummaryObject *next;

@end

@implementation RCEventObject

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
		self.lastModified = [self dateFromString:dictionary[RCResponseKeyModified]];
		self.start = [self dateFromString:dictionary[RCResponseKeyStart]];
		self.end = [self dateFromString:dictionary[RCResponseKeyEnd]];
		self.thumbnail = [[RCImageObject alloc] initWithDictionary:dictionary[RCResponseKeyThumbnail]];
		self.comics = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyComics]];
		self.stories = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyStories]];
		self.series = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeySeries]];
		self.characters = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyCharacters]];
		self.creators = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyCreators]];
		self.previous = [[RCSummaryObject alloc] initWithDictionary:dictionary[RCResponseKeyPrevious]];
		self.next = [[RCSummaryObject alloc] initWithDictionary:dictionary[RCResponseKeyNext]];
	}

	return self;
}

@end
