//
//  RCStoryFilter.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCStoryFilter.h"

@interface RCStoryFilter ()

@end

@implementation RCStoryFilter

- (NSArray *)validOrderTypes
{
	return @[@(RCOrderByTypeCodeIdentifierAscending),
			 @(RCOrderByTypeCodeIdentifierDescending),
			 @(RCOrderByTypeCodeDateModifiedAscending),
			 @(RCOrderByTypeCodeDateModifiedDescending)];
}

- (RCAPITypes)type
{
	return RCAPITypeStories;
}

@end
