//
//  RCEventObject.m
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

#import "RCEventObject.h"
#import "RCResponseKeys.h"

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
@property (nonatomic, strong) RCSummaryObject *next;
@property (nonatomic, strong) RCSummaryObject *previous;

@end

@implementation RCEventObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	if (![self isValidObject:dictionary]) {
		return nil;
	}

	self = [super init];

	if (self) {
		self.identifier = dictionary[RCResponseKeyIdentifier];
		self.title = dictionary[RCResponseKeyTitle];
		self.summary = dictionary[RCResponseKeyDescription];

		if ([self isValidObject:dictionary]) {
			self.resourceURI = [NSURL URLWithString:dictionary[RCResponseKeyResourceURI]];
		}

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
