//
//  RCFilter.m
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

#import "RCFilter.h"
#import "RCOrderByTypes.h"
#import "RCRequestKeys.h"

@interface RCFilter ()

/*!
 @property
 
 This property gets a string formed by every RCOrderByTypeCodes value allowed by the filter.
 
 Each and every order by type is converted to its string counterpart and, in case it is a descending order by type, the "-" as a suffix is added to the string value.
 
 @internal
 */
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

/*!
 @method
 
 This methods converts a given date into its string representation formatted as "yyyy-MM-dd'T'HH:mm:ssZ".
 
 @param date A date
 
 @return A string that represent a given date
 
 @internal
 */
- (NSString *)stringFromDate:(NSDate *)date
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

	formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";

	return [formatter stringFromDate:date];
}

/*!
 @method

 This methods checks if a given order type value is a descending type or not.

 @param orderBy An integer that represent a RCOrderByTypeCodes value.

 @return YES in case the given order type value is a descending type.
		 NO in case the given order type value is an ascending type.
 
 @internal
 */
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
