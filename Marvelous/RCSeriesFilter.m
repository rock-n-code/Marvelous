//
//  RCSeriesFilter.m
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

#import "RCSeriesFilter.h"
#import "RCFormatTypes.h"
#import "RCSeriesTypes.h"

@interface RCSeriesFilter ()

@property (nonatomic, readonly, strong) NSString *stringfiedContains;
@property (nonatomic, readonly, strong) NSString *stringfiedSeriesType;

@end

@implementation RCSeriesFilter

#pragma mark - Properties

- (NSDictionary *)parameters
{
	NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:super.parameters];

	if (self.title) {
		params[RCRequestKeyTitle] = self.title;
	}

	if (self.titleStartsWith) {
		params[RCRequestKeyTitleStartsWith] = self.titleStartsWith;
	}

	if (self.startYear) {
		params[RCRequestKeyStartYear] = self.startYear;
	}

	if (self.comics) {
		params[RCRequestKeyComics] = [self.comics componentsJoinedByString:@","];
	}

	if (self.stories) {
		params[RCRequestKeyStories] = [self.stories componentsJoinedByString:@","];
	}

	if (self.events) {
		params[RCRequestKeyEvents] = [self.events componentsJoinedByString:@","];
	}

	if (self.creators) {
		params[RCRequestKeyCreators] = [self.creators componentsJoinedByString:@","];
	}

	if (self.characters) {
		params[RCRequestKeyCharacters] = [self.characters componentsJoinedByString:@","];
	}

	if (self.contains) {
		params[RCRequestKeyContains] = self.stringfiedContains;
	}

	if (self.seriesType != RCSeriesTypeCodeUndefined) {
		params[RCRequestKeySeriesType] = self.stringfiedSeriesType;
	}

	return params;
}

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
