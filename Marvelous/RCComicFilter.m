//
//  RCComicFilter.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCComicFilter.h"

@interface RCComicFilter ()

@end

@implementation RCComicFilter

- (NSArray *)validOrderTypes
{
	return @[@(RCOrderByTypeCodeFOCDateAscending),
			 @(RCOrderByTypeCodeFOCDateDescending),
			 @(RCOrderByTypeCodeOnSaleDateAscending),
			 @(RCOrderByTypeCodeOnSaleDateDescending),
			 @(RCOrderByTypeCodeTitleAscending),
			 @(RCOrderByTypeCodeTitleDescending),
			 @(RCOrderByTypeCodeIssueNumberAscending),
			 @(RCOrderByTypeCodeIssueNumberDescending),
			 @(RCOrderByTypeCodeDateModifiedAscending),
			 @(RCOrderByTypeCodeDateModifiedDescending),];
}

- (RCAPITypes)type
{
	return RCAPITypeComics;
}

@end
