//
//  RCComicsFilter.m
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

#import "RCComicsFilter.h"
#import "RCIssueFormats.h"
#import "RCIssueTypes.h"
#import "RCBooleanValues.h"
#import "RCDateDescriptors.h"
#import "RCRequestKeys.h"

@interface RCComicsFilter ()

/*!
 @property

 This property gets a string representation of a RCIssueFormatCodes value.

 @internal
 */
@property (nonatomic, readonly, strong) NSString *stringfiedFormat;

/*!
 @property

 This property gets a string representation of a RCIssueTypeCodes value.

 @internal
 */
@property (nonatomic, readonly, strong) NSString *stringfiedFormatType;

/*!
 @property

 This property gets a string representation of a RCDateDescriptorCodes value.

 @internal
 */
@property (nonatomic, readonly, strong) NSString *stringfiedDateDescriptor;

/*!
 @property

 This property gets a string representation of a list of dates (represented as NSDate objects).
 
 Every string that represents a given date is formatted as "yyyy-MM-dd" and they are joined by a comma (",").

 @internal
 */
@property (nonatomic, readonly, strong) NSString *stringfiedDateRange;

@end

@implementation RCComicsFilter

#pragma mark - Properties

- (NSDictionary *)parameters
{
	NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:super.parameters];

	if (self.format != RCIssueFormatCodeUndefined) {
		params[RCRequestKeyFormat] = self.stringfiedFormat;
	}

	if (self.formatType != RCIssueTypeCodeUndefined) {
		params[RCRequestKeyFormatType] = self.stringfiedFormatType;
	}

	if (self.noVariants != RCBooleanValueCodeUndefined) {
		params[RCRequestKeyNoVariants] = [self stringForBooleanValue:self.noVariants];
	}

	if (self.dateDescriptor != RCDateDescriptorCodeUndefined) {
		params[RCRequestKeyDateDescriptor] = self.stringfiedDateDescriptor;
	}

	if (self.dateRange && self.dateRange.count == 2) {
		params[RCRequestKeyDateRange] = self.stringfiedDateRange;
	}

	if (self.title) {
		params[RCRequestKeyTitle] = self.title;
	}

	if (self.titleStartsWith) {
		params[RCRequestKeyTitleStartsWith] = self.titleStartsWith;
	}

	if (self.issueNumber) {
		params[RCRequestKeyIssueNumber] = self.issueNumber;
	}

	if (self.startYear) {
		params[RCRequestKeyStartYear] = self.startYear;
	}

	if (self.diamondCode) {
		params[RCRequestKeyDiamondCode] = self.diamondCode;
	}

	if (self.digitalIdentifier) {
		params[RCRequestKeyDigitalIdentifier] = self.digitalIdentifier;
	}

	if (self.upc) {
		params[RCRequestKeyUPC] = self.upc;
	}

	if (self.isbn) {
		params[RCRequestKeyISBN] = self.isbn;
	}

	if (self.ean) {
		params[RCRequestKeyEAN] = self.ean;
	}

	if (self.issn) {
		params[RCRequestKeyISSN] = self.issn;
	}

	if (self.hasDigitalIssue != RCBooleanValueCodeUndefined) {
		params[RCRequestKeyHasDigitalIssue] = [self stringForBooleanValue:self.hasDigitalIssue];
	}

	if (self.creators) {
		params[RCRequestKeyCreators] = [self.creators componentsJoinedByString:@","];
	}

	if (self.characters) {
		params[RCRequestKeyCharacters] = [self.characters componentsJoinedByString:@","];
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

	if (self.sharedAppearances) {
		params[RCRequestKeySharedAppearances] = [self.sharedAppearances componentsJoinedByString:@","];
	}

	if (self.collaborators) {
		params[RCRequestKeyCollaborators] = [self.collaborators componentsJoinedByString:@","];
	}

	return params;
}

- (NSString *)stringfiedFormat
{
	switch (self.format) {
		case RCIssueFormatCodeComic:
			return RCIssueFormatComic;
		case RCIssueFormatCodeMagazine:
			return RCIssueFormatMagazine;
		case RCIssueFormatCodeTradePaperback:
			return RCIssueFormatTradePaperback;
		case RCIssueFormatCodeHardcover:
			return RCIssueFormatHardcover;
		case RCIssueFormatCodeDigest:
			return RCIssueFormatDigest;
		case RCIssueFormatCodeGraphicNovel:
			return RCIssueFormatGraphicNovel;
		case RCIssueFormatCodeDigitalComic:
			return RCIssueFormatDigitalComic;
		default:
			return RCIssueFormatInfiniteComic;
	}
}

- (NSString *)stringfiedFormatType
{
	if (self.formatType == RCIssueTypeCodeComic) {
		return RCIssueTypeComic;
	} else {
		return RCIssueTypeCollection;
	}
}

- (NSString *)stringfiedDateDescriptor
{
	switch (self.dateDescriptor) {
		case RCDateDescriptorCodeLastWeek:
			return RCDateDescriptorLastWeek;
		case RCDateDescriptorCodeThisWeek:
			return RCDateDescriptorThisWeek;
		case RCDateDescriptorCodeNextWeek:
			return RCDateDescriptorNextWeek;
		default:
			return RCDateDescriptorThisMonth;
	}
}

- (NSString *)stringfiedDateRange
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	NSMutableArray *strings = [NSMutableArray array];

	formatter.dateFormat = @"yyyy-MM-dd";

	[self.dateRange enumerateObjectsUsingBlock:^(NSDate *date, NSUInteger index, BOOL *stop) {
		NSString *stringfiedDate = [formatter stringFromDate:date];

		[strings addObject:stringfiedDate];
	}];

	return [strings componentsJoinedByString:@","];
}

- (NSArray *)validOrderTypes
{
	return @[@(RCOrderByTypeCodeFinalOrderCutoffDateAscending),
			 @(RCOrderByTypeCodeFinalOrderCutoffDateDescending),
			 @(RCOrderByTypeCodeOnSaleDateAscending),
			 @(RCOrderByTypeCodeOnSaleDateDescending),
			 @(RCOrderByTypeCodeTitleAscending),
			 @(RCOrderByTypeCodeTitleDescending),
			 @(RCOrderByTypeCodeIssueNumberAscending),
			 @(RCOrderByTypeCodeIssueNumberDescending),
			 @(RCOrderByTypeCodeDateModifiedAscending),
			 @(RCOrderByTypeCodeDateModifiedDescending)];
}

- (RCAPITypes)type
{
	return RCAPITypeComics;
}

#pragma mark - Private methods

/*!
 @method

 This methods converts a given boolean value to string.

 @param boolean An integer that represent a RCBooleanValueCodes value.

 @return A string that represent the given boolean value.

 @internal
 */
- (NSString *)stringForBooleanValue:(RCBooleanValueCodes)boolean
{
	if (boolean == RCBooleanValueCodeTrue) {
		return RCBooleanValueTrue;
	} else {
		return RCBooleanValueFalse;
	}
}

@end
