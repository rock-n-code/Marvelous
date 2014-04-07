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
			} else if (orderBy == RCOrderByTypeCodeFirstNameAscending ||
					   orderBy == RCOrderByTypeCodeFirstNameDescending) {
				string = RCOrderByTypeFirstName;
			} else if (orderBy == RCOrderByTypeCodeMiddleNameAscending ||
						 orderBy == RCOrderByTypeCodeMiddleNameDescending) {
				string = RCOrderByTypeMiddleName;
			} else if (orderBy == RCOrderByTypeCodeLastNameAscending ||
					   orderBy == RCOrderByTypeCodeLastNameDescending) {
				string = RCOrderByTypeLastName;
			} else if (orderBy == RCOrderByTypeCodeSuffixAscending ||
					   orderBy == RCOrderByTypeCodeSuffixDescending) {
				string = RCOrderByTypeSuffix;
			} else if (orderBy == RCOrderByTypeCodeNameAscending ||
					   orderBy == RCOrderByTypeCodeNameDescending) {
				string = RCOrderByTypeName;
			} else if (orderBy == RCOrderByTypeCodeTitleAscending ||
					   orderBy == RCOrderByTypeCodeTitleDescending) {
				string = RCOrderByTypeTitle;
			} else if (orderBy == RCOrderByTypeCodeDateModifiedAscending ||
					   orderBy == RCOrderByTypeCodeDateModifiedDescending) {
				string = RCOrderByTypeDateModified;
			} else if (orderBy == RCOrderByTypeCodeStartDateAscending ||
					   orderBy == RCOrderByTypeCodeStartDateDescending) {
				string = RCOrderByTypeStartDate;
			} else if (orderBy == RCOrderByTypeCodeStartYearAscending ||
					   orderBy == RCOrderByTypeCodeStartYearDescending) {
				string = RCOrderByTypeStartYear;
			} else if (orderBy == RCOrderByTypeCodeFinalOrderCutoffDateAscending ||
					   orderBy == RCOrderByTypeCodeFinalOrderCutoffDateDescending) {
				string = RCOrderByTypeFinalOrderCutoffDate;
			} else if (orderBy == RCOrderByTypeCodeOnSaleDateAscending ||
					   orderBy == RCOrderByTypeCodeOnSaleDateDescending) {
				string = RCOrderByTypeOnSaleDate;
			} else if (orderBy == RCOrderByTypeCodeIssueNumberAscending ||
					   orderBy == RCOrderByTypeCodeIssueNumberDescending) {
				string = RCOrderByTypeIssueNumber;
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
		   orderBy == RCOrderByTypeCodeFirstNameDescending ||
		   orderBy == RCOrderByTypeCodeMiddleNameDescending ||
		   orderBy == RCOrderByTypeCodeLastNameDescending ||
		   orderBy == RCOrderByTypeCodeSuffixDescending ||
		   orderBy == RCOrderByTypeCodeNameDescending ||
		   orderBy == RCOrderByTypeCodeTitleDescending ||
		   orderBy == RCOrderByTypeCodeDateModifiedDescending ||
		   orderBy == RCOrderByTypeCodeStartDateDescending ||
		   orderBy == RCOrderByTypeCodeStartYearDescending ||
		   orderBy == RCOrderByTypeCodeFinalOrderCutoffDateDescending ||
		   orderBy == RCOrderByTypeCodeOnSaleDateDescending ||
		   orderBy == RCOrderByTypeCodeIssueNumberDescending;
}

@end
