//
//  RCCharacterFilter.m
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCCharacterFilter.h"

@interface RCCharacterFilter ()

@end

@implementation RCCharacterFilter

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
	return @[@(RCOrderByTypeCodeNameAscending),
			 @(RCOrderByTypeCodeNameDescending),
			 @(RCOrderByTypeCodeDateModifiedAscending),
			 @(RCOrderByTypeCodeDateModifiedDescending)];
}

- (RCAPITypes)type
{
	return RCAPITypeCharacters;
}

@end
