//
//  RCCreatorFilter.m
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

#import "RCCreatorFilter.h"
#import "RCRequestKeys.h"

@interface RCCreatorFilter ()

@end

@implementation RCCreatorFilter

#pragma mark - Properties

- (NSDictionary *)parameters
{
	NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:super.parameters];

	if (self.firstName) {
		params[RCRequestKeyFirstName] = self.firstName;
	}

	if (self.middleName) {
		params[RCRequestKeyMiddleName] = self.middleName;
	}

	if (self.lastName) {
		params[RCRequestKeyLastName] = self.lastName;
	}

	if (self.suffix) {
		params[RCRequestKeySuffix] = self.suffix;
	}

	if (self.nameStartsWith) {
		params[RCRequestKeyNameStartsWith] = self.nameStartsWith;
	}

	if (self.firstNameStartsWith) {
		params[RCRequestKeyFirstNameStartsWith] = self.firstNameStartsWith;
	}

	if (self.middleNameStartsWith) {
		params[RCRequestKeyMiddleNameStartsWith] = self.middleNameStartsWith;
	}

	if (self.lastNameStartsWith) {
		params[RCRequestKeyLastNameStartsWith] = self.lastNameStartsWith;
	}

	if (self.comics) {
		params[RCRequestKeyComics] = [self.comics componentsJoinedByString:@","];
	}

	if (self.series) {
		params[RCRequestKeySeries] = [self.series componentsJoinedByString:@","];
	}

	if (self.events) {
		params[RCRequestKeyEvents] = [self.events componentsJoinedByString:@","];
	}

	if (self.stories) {
		params[RCRequestKeyStories] = [self.stories componentsJoinedByString:@","];
	}

	return params;
}

- (NSArray *)validOrderTypes
{
	return @[@(RCOrderByTypeCodeFirstNameAscending),
			 @(RCOrderByTypeCodeFirstNameDescending),
			 @(RCOrderByTypeCodeMiddleNameAscending),
			 @(RCOrderByTypeCodeMiddleNameDescending),
			 @(RCOrderByTypeCodeLastNameAscending),
			 @(RCOrderByTypeCodeLastNameDescending),
			 @(RCOrderByTypeCodeSuffixAscending),
			 @(RCOrderByTypeCodeSuffixDescending),
			 @(RCOrderByTypeCodeDateModifiedAscending),
			 @(RCOrderByTypeCodeDateModifiedDescending)];
}

- (RCAPITypes)type
{
	return RCAPITypeCreators;
}

@end
