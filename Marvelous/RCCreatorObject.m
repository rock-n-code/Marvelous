//
//  RCCreatorObject.m
//  Marvelous
//
//  Copyright (c) 2014 Rock & Code [http://rock-n-code.com]
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "RCCreatorObject.h"
#import "RCResponseKeys.h"

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
@property (nonatomic, strong) RCListObject *series;
@property (nonatomic, strong) RCListObject *stories;
@property (nonatomic, strong) RCListObject *comics;
@property (nonatomic, strong) RCListObject *events;

@end

@implementation RCCreatorObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	if (![self isValidObject:dictionary]) {
		return nil;
	}

	self = [super init];

	if (self) {
		self.identifier = dictionary[RCResponseKeyIdentifier];
		self.firstName = dictionary[RCResponseKeyFirstName];
		self.middleName = dictionary[RCResponseKeyMiddleName];
		self.lastName = dictionary[RCResponseKeyLastName];
		self.suffix = dictionary[RCResponseKeySuffix];
		self.fullName = dictionary[RCResponseKeyFullName];
		self.lastModified = [self dateFromString:dictionary[RCResponseKeyModified]];

		if ([self isValidObject:dictionary[RCResponseKeyResourceURI]]) {
			self.resourceURI = [NSURL URLWithString:dictionary[RCResponseKeyResourceURI]];
		}

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
