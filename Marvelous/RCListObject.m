//
//  RCListObject.m
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

#import "RCListObject.h"
#import "RCSummaryObject.h"
#import "RCResponseKeys.h"

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
	if (![self isValidObject:dictionary]) {
		return nil;
	}

	self = [super init];

	if (self) {
		self.available = dictionary[RCResponseKeyAvailable];
		self.returned = dictionary[RCResponseKeyReturned];

		if ([self isValidObject:dictionary[RCResponseKeyCollectionURI]]) {
			self.collectionURI = [NSURL URLWithString:dictionary[RCResponseKeyCollectionURI]];
		}

		if ([self isValidObject:dictionary[RCResponseKeyItems]]) {
			self.items = [self itemsFromArray:dictionary[RCResponseKeyItems]];
		}
	}

	return self;
}

#pragma mark - Private methods

/*!
 @method

 This method obtain a list of summary objects from a given list of JSON dictionaries returned by an API endpoint.

 @param array A list of given JSON dictionaries

 @return A list of RCSummaryObject objects obtained from the dictionaries
 
 @internal
 */
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
