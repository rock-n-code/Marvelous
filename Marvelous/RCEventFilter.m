//
//  RCEventFilter.m
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

#import "RCEventFilter.h"
#import "RCRequestKeys.h"

@interface RCEventFilter ()

@end

@implementation RCEventFilter

#pragma mark - Properties

- (NSDictionary *)parameters
{
	NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:super.parameters];

	if (self.name) {
		params[RCRequestKeyName] = self.name;
	}

	if (self.nameStartsWith) {
		params[RCRequestKeyNameStartsWith] = self.nameStartsWith;
	}

	if (self.creators) {
		params[RCRequestKeyCreators] = [self.creators componentsJoinedByString:@","];
	}

	if (self.characters) {
		params[RCRequestKeyCharacters] = [self.characters componentsJoinedByString:@","];
	}

	if (self.comics) {
		params[RCRequestKeyComics] = [self.comics componentsJoinedByString:@","];
	}

	if (self.series) {
		params[RCRequestKeySeries] = [self.series componentsJoinedByString:@","];
	}

	if (self.stories) {
		params[RCRequestKeyStories] = [self.stories componentsJoinedByString:@","];
	}

	return params;
}

- (NSArray *)validOrderTypes
{
	return @[@(RCOrderByTypeCodeNameAscending),
			 @(RCOrderByTypeCodeNameDescending),
			 @(RCOrderByTypeCodeDateModifiedAscending),
			 @(RCOrderByTypeCodeDateModifiedDescending),
			 @(RCOrderByTypeCodeStartDateAscending),
			 @(RCOrderByTypeCodeStartDateDescending)];
}

- (RCAPITypes)type
{
	return RCAPITypeEvents;
}

@end
