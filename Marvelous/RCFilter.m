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

	if (self.modifiedSince) {
		params[RCRequestKeyModifiedSince] = [self stringFromDate:self.modifiedSince];
	}

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

- (RCAPITypes)type
{
	return RCAPITypeUndefined;
}

- (NSString *)stringfiedOrderBy
{
	NSMutableArray *strings = [NSMutableArray array];

	[self.orderBy enumerateObjectsUsingBlock:^(NSNumber *filter, NSUInteger index, BOOL *stop) {
		if ([self.validOrderTypes containsObject:filter]) {
			NSString *string = @"";

			NSInteger orderBy = filter.integerValue;

			if (orderBy == RCOrderByTypeCodeIdentifierAscending ||
				orderBy == RCOrderByTypeCodeIdentifierDescending) {
				string = RCOrderByTypeIdentifier;
			} else if (orderBy == RCOrderByTypeCodeNameAscending ||
				orderBy == RCOrderByTypeCodeNameDescending) {
				string = RCOrderByTypeName;
			} else if (orderBy == RCOrderByTypeCodeDateModifiedAscending ||
					   orderBy == RCOrderByTypeCodeDateModifiedDescending) {
				string = RCOrderByTypeDateModified;
			} else if (orderBy == RCOrderByTypeCodeStartDateAscending ||
					   orderBy == RCOrderByTypeCodeStartDateDescending) {
				string = RCOrderByTypeStartDate;
			}

			if ([self isDescendingOrderBy:orderBy]) {
				string = [@"-" stringByAppendingString:string];
			}

			[strings addObject:string];
		}
	}];

	return [strings componentsJoinedByString:@","];
}

#pragma mark - Private methods

- (NSString *)stringFromDate:(NSDate *)date
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

	formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";

	return [formatter stringFromDate:date];
}

- (BOOL)isDescendingOrderBy:(NSInteger)orderBy
{
	return orderBy == RCOrderByTypeCodeIdentifierDescending ||
		   orderBy == RCOrderByTypeCodeNameDescending ||
		   orderBy == RCOrderByTypeCodeDateModifiedDescending ||
		   orderBy == RCOrderByTypeCodeStartDateDescending;
}

@end
