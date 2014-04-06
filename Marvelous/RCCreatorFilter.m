//
//  RCCreatorFilter.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCCreatorFilter.h"

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
