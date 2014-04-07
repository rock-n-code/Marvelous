//
//  RCStoryObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCStoryObject.h"

@interface RCStoryObject ()

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSURL *resourceURI;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSDate *lastModified;
@property (nonatomic, strong) RCImageObject *thumbnail;
@property (nonatomic, strong) RCListObject *comics;
@property (nonatomic, strong) RCListObject *series;
@property (nonatomic, strong) RCListObject *events;
@property (nonatomic, strong) RCListObject *characters;
@property (nonatomic, strong) RCListObject *creators;
@property (nonatomic, strong) RCSummaryObject *originalIssue;

@end

@implementation RCStoryObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];

	if (self) {
		self.identifier = dictionary[RCResponseKeyIdentifier];
		self.title = dictionary[RCResponseKeyTitle];
		self.summary = dictionary[RCResponseKeyDescription];
		self.resourceURI = [NSURL URLWithString:dictionary[RCResponseKeyResourceURI]];
		self.type = dictionary[RCResponseKeyType];
		self.lastModified = [self dateFromString:dictionary[RCResponseKeyModified]];
		self.thumbnail = [[RCImageObject alloc] initWithDictionary:dictionary[RCResponseKeyThumbnail]];
		self.comics = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyComics]];
		self.series = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeySeries]];
		self.events = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyEvents]];
		self.characters = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyCharacters]];
		self.creators = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyCreators]];
		self.originalIssue = [[RCSummaryObject alloc] initWithDictionary:dictionary[RCResponseKeyOriginalIssue]];
	}

	return self;
}

@end
