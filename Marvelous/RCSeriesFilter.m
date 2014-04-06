//
//  RCSeriesFilter.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCSeriesFilter.h"
#import "RCFormatTypes.h"
#import "RCSeriesTypes.h"

@interface RCSeriesFilter ()

@property (nonatomic, readonly, strong) NSString *stringfiedContains;
@property (nonatomic, readonly, strong) NSString *stringfiedSeriesType;

@end

@implementation RCSeriesFilter

- (NSArray *)validOrderTypes
{
	return @[@(RCOrderByTypeCodeTitleAscending),
			 @(RCOrderByTypeCodeTitleDescending),
			 @(RCOrderByTypeCodeDateModifiedAscending),
			 @(RCOrderByTypeCodeDateModifiedDescending),
			 @(RCOrderByTypeCodeStartYearAscending),
			 @(RCOrderByTypeCodeStartYearDescending)];
}

- (RCAPITypes)type
{
	return RCAPITypeSeries;
}

- (NSString *)stringfiedContains
{
	NSMutableArray *strings = [NSMutableArray array];

	[self.contains enumerateObjectsUsingBlock:^(NSNumber *formatType, NSUInteger index, BOOL *stop) {
		if (formatType.integerValue != RCFormatTypeCodeUndefined) {
			NSInteger type = formatType.integerValue;
			NSString *string = @"";

			if (type == RCFormatTypeCodeComic) {
				string = RCFormatTypeComic;
			} else if (type == RCFormatTypeCodeMagazine) {
				string = RCFormatTypeMagazine;
			} else if (type == RCFormatTypeCodeTradePaperback) {
				string = RCFormatTypeTradePaperback;
			} else if (type == RCFormatTypeCodeHardcover) {
				string = RCFormatTypeHardcover;
			} else if (type == RCFormatTypeCodeDigest) {
				string = RCFormatTypeDigest;
			} else if (type == RCFormatTypeCodeGraphicNovel) {
				string = RCFormatTypeGraphicNovel;
			} else if (type == RCFormatTypeCodeDigitalComic) {
				string = RCFormatTypeDigitalComic;
			} else {
				string = RCFormatTypeInfiniteComic;
			}

			[strings addObject:string];
		}
	}];

	return [strings componentsJoinedByString:@","];
}

- (NSString *)stringfiedSeriesType
{
	switch (self.seriesType) {
		case RCSeriesTypeCodeCollection:
			return RCSeriesTypeCollection;
		case RCSeriesTypeCodeOneShot:
			return RCSeriesTypeOneShot;
		case RCSeriesTypeCodeLimited:
			return RCSeriesTypeLimited;
		default:
			return RCSeriesTypeOngoing;
	}
}

@end
