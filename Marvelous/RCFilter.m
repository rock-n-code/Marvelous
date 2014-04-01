//
//  RCFilter.m
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCFilter.h"
#import "RCOrderByTypes.h"

@interface RCFilter ()

@property (nonatomic, readonly, strong) NSString *stringfiedOrderBy;

@end

@implementation RCFilter

#pragma mark - Properties

- (NSDictionary *)parameters
{
	NSMutableDictionary *params = [NSMutableDictionary dictionary];

	if (self.limit) {
		params[RCRequestKeyLimit] = self.limit.stringValue;
	}

	if (self.offset) {
		params[RCRequestKeyOffset] = self.offset.stringValue;
	}

	if (self.orderBy != RCOrderByTypeCodeUndefined) {
		params[RCRequestKeyOrderBy] = self.stringfiedOrderBy;
	}

	return params;
}

- (NSString *)stringfiedOrderBy
{
	if (self.orderBy == RCOrderByTypeCodeNameAscending) {
		return RCOrderByTypeNameAscending;
	} else if (self.orderBy == RCOrderByTypeCodeNameDescending) {
		return RCOrderByTypeNameDescending;
	} else if (self.orderBy == RCOrderByTypeCodeDateModifiedAscending) {
		return RCOrderByTypeDateModifiedAscending;
	} else if (self.orderBy == RCOrderByTypeCodeDateModifiedDescending) {
		return RCOrderByTypeDateModifiedDescending;
	} else {
		return @"";
	}
}

@end
