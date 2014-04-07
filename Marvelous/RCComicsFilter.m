//
//  RCComicsFilter.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCComicsFilter.h"
#import "RCFormatTypes.h"
#import "RCIssueTypes.h"
#import "RCBooleanValues.h"
#import "RCDateDescriptors.h"

@interface RCComicsFilter ()

@property (nonatomic, readonly, strong) NSString *stringfiedFormat;
@property (nonatomic, readonly, strong) NSString *stringfiedFormatType;
@property (nonatomic, readonly, strong) NSString *stringfiedDateDescriptor;
@property (nonatomic, readonly, strong) NSString *stringfiedDateRange;

@end

@implementation RCComicsFilter

#pragma mark - Properties

- (NSDictionary *)parameters
{
	NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:super.parameters];

	if (self.format != RCFormatTypeCodeUndefined) {
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
		case RCFormatTypeCodeComic:
			return RCFormatTypeComic;
		case RCFormatTypeCodeMagazine:
			return RCFormatTypeMagazine;
		case RCFormatTypeCodeTradePaperback:
			return RCFormatTypeTradePaperback;
		case RCFormatTypeCodeHardcover:
			return RCFormatTypeHardcover;
		case RCFormatTypeCodeDigest:
			return RCFormatTypeDigest;
		case RCFormatTypeCodeGraphicNovel:
			return RCFormatTypeGraphicNovel;
		case RCFormatTypeCodeDigitalComic:
			return RCFormatTypeDigitalComic;
		default:
			return RCFormatTypeInfiniteComic;
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

- (NSString *)stringForBooleanValue:(RCBooleanValueCodes)boolean
{
	if (boolean == RCBooleanValueCodeTrue) {
		return RCBooleanValueTrue;
	} else {
		return RCBooleanValueFalse;
	}
}

@end
