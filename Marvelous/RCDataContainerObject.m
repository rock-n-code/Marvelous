//
//  RCDataContainerObject.m
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
	if (type == RCAPITypeUndefined || ![self isValidObject:dictionary]) {
		return nil;
	}

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

/*!
 @method

 This method obtain a list of objects created based on a given object type from a given list of JSON dictionaries returned by an API endpoint.

 @param array A list of given JSON dictionaries
 @param type The type in which every object has to be created

 @return A list of RCObject objects obtained from the dictionaries

 @internal
 */
- (NSArray *)resultsFromArray:(NSArray *)array andType:(RCAPITypes)type
{
	if (![self isValidObject:array]) {
		return nil;
	}
	
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
