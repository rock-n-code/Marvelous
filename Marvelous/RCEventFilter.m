//
//  RCEventFilter.m
//  Marvelous
//
//  Created by Javier Cicchelli on 02/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCEventFilter.h"

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

	if (self.comics) {
		params[RCRequestKeyComics] = [self.comics componentsJoinedByString:@","];
	}

	if (self.series) {
		params[RCRequestKeySeries] = [self.series componentsJoinedByString:@","];
	}

	if (self.stories) {
		params[RCRequestKeyStories] = [self.stories componentsJoinedByString:@","];
	}

	if (self.creators) {
		params[RCRequestKeyCreators] = [self.creators componentsJoinedByString:@","];
	}

	return params;
}

- (RCAPITypes)type
{
	return RCAPITypeEvents;
}

@end
