//
//  RCCharacterObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCCharacterObject.h"
#import "RCResponseKeys.h"
#import "RCURLObject.h"

@interface RCCharacterObject ()

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, strong) NSDate *lastModified;
@property (nonatomic, strong) NSURL *resourceURI;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) NSURL *thumbnail;
@property (nonatomic, strong) RCListObject *comics;
@property (nonatomic, strong) RCListObject *stories;
@property (nonatomic, strong) RCListObject *events;
@property (nonatomic, strong) RCListObject *series;

@end

@implementation RCCharacterObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];

	if (self) {
		self.identifier = @([dictionary[RCResponseKeyIdentifier] integerValue]);
		self.name = dictionary[RCResponseKeyName];
		self.bio = dictionary[RCResponseKeyDescription];
		self.lastModified = [self dateFromString:dictionary[RCResponseKeyModified]];
		self.resourceURI = [NSURL URLWithString:dictionary[RCResponseKeyResourceURI]];
		self.urls = [self urlsFromArray:dictionary[RCResponseKeyURLs]];
		self.thumbnail = [self thumbnailFromDictionary:dictionary[RCResponseKeyThumbnail]];
		self.comics = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyComics]];
		self.stories = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyStories]];
		self.events = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeyEvents]];
		self.series = [[RCListObject alloc] initWithDictionary:dictionary[RCResponseKeySeries]];
	}

	return self;
}

#pragma mark - Private methods

- (NSDate *)dateFromString:(NSString *)string
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

	formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";

	return [formatter dateFromString:string];
}

- (NSArray *)urlsFromArray:(NSArray *)array
{
	NSMutableArray *urls = [NSMutableArray array];

	[array enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger index, BOOL *stop) {
		RCURLObject *url = [[RCURLObject alloc] initWithDictionary:dictionary];

		[urls addObject:url];
	}];

	return urls;
}

- (NSURL *)thumbnailFromDictionary:(NSDictionary *)dictionary
{
	NSArray *strings = @[dictionary[RCResponseKeyPath],
						 dictionary[RCResponseKeyExtension]];

	return [NSURL URLWithString:[strings componentsJoinedByString:@"."]];
}

@end
