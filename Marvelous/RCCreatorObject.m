//
//  RCCreatorObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCCreatorObject.h"

@interface RCCreatorObject ()

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *middleName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *suffix;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSDate *lastModified;
@property (nonatomic, strong) NSURL *resourceURI;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) RCImageObject *thumbnail;
@property (nonatomic, strong) RCListObject *comics;
@property (nonatomic, strong) RCListObject *stories;
@property (nonatomic, strong) RCListObject *series;
@property (nonatomic, strong) RCListObject *events;

@end

@implementation RCCreatorObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];

	if (self) {
		self.identifier = dictionary[RCResponseKeyIdentifier];
		self.firstName = dictionary[RCResponseKeyFirstName];
		self.middleName = dictionary[RCResponseKeyMiddleName];
		self.lastName = dictionary[RCResponseKeyLastName];
		self.suffix = dictionary[RCResponseKeySuffix];
		self.fullName = dictionary[RCResponseKeyFullName];
		self.lastModified = [self dateFromString:dictionary[RCResponseKeyModified]];
		self.resourceURI = [NSURL URLWithString:dictionary[RCResponseKeyResourceURI]];
		self.urls = [self urlsFromArray:dictionary[RCResponseKeyURLs]];
		self.thumbnail = [[RCImageObject alloc] initWithDictionary:dictionary[RCResponseKeyThumbnail]];
		self.comics = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyComics]];
		self.stories = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyStories]];
		self.series = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeySeries]];
		self.events = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyEvents]];
	}

	return self;
}

@end
