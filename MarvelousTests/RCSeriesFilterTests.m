//
//  RCSeriesFilterTests.m
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

#import <XCTest/XCTest.h>

#import "RCSeriesFilter.h"

@interface RCSeriesFilterTests : XCTestCase

@end

@implementation RCSeriesFilterTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInit
{
    RCSeriesFilter *filter = [[RCSeriesFilter alloc] init];

	XCTAssertNil(filter.title, @"\"%s\" is expecting the property 'title' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.titleStartsWith, @"\"%s\" is expecting the property 'titleStartsWith' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.startYear, @"\"%s\" is expecting the property 'startYear' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.modifiedSince, @"\"%s\" is expecting the property 'modifiedSince' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.comics, @"\"%s\" is expecting the property 'comics' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.stories, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.events, @"\"%s\" is expecting the property 'events' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.creators, @"\"%s\" is expecting the property 'creators' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.characters, @"\"%s\" is expecting the property 'characters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(filter.seriesType, RCSeriesTypeCodeUndefined, @"\"%s\" is expecting the property 'count' of the property 'validOrderTypes' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)RCSeriesTypeCodeUndefined);
	XCTAssertNil(filter.contains, @"\"%s\" is expecting the property 'contains' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
    XCTAssertNil(filter.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.orderBy, @"\"%s\" is expecting the property 'orderBy' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(filter.validOrderTypes, @"\"%s\" is expecting the property 'validOrderTypes' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testParameters
{
	RCSeriesFilter *filter = [[RCSeriesFilter alloc] init];

	filter.title = @"TestTitle";
	filter.titleStartsWith = @"TestTitleStartsWith";
	filter.startYear = @2014;
	filter.modifiedSince = [NSDate date];
	filter.comics = @[@0, @1, @2];
	filter.stories = @[@"0", @"1", @"2"];
	filter.events = @[@"0", @"1", @"2"];
	filter.creators = @[@0, @1, @2];
	filter.characters = @[@"0", @"2", @"4"];
	filter.seriesType = RCFrequencyTypeCodeOneShot;
	filter.contains = @[@(RCIssueFormatCodeComic), @(RCIssueFormatCodeTradePaperback)];
	filter.orderBy = @[@(RCOrderByTypeCodeTitleDescending), @(RCOrderByTypeCodeStartYearAscending)];
	filter.offset = @0;
	filter.limit = @0;

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 14;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testPartialParameters
{
	RCSeriesFilter *filter = [[RCSeriesFilter alloc] init];

	filter.title = @"TestTitle";
	filter.startYear = @2013;
	filter.comics = @[@0, @2, @4];
	filter.stories = @[@"0", @"1", @"2"];
	filter.events = @[@"0", @"2", @"4"];
	filter.limit = @0;
	filter.orderBy = @[@(RCOrderByTypeCodeDateModifiedAscending)];

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 7;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testValidOrderTypes
{
	RCSeriesFilter *filter = [[RCSeriesFilter alloc] init];
	NSInteger countToTest = 6;

	XCTAssertEqual(filter.validOrderTypes.count, countToTest, @"\"%s\" is expecting the property 'count' of the property 'validOrderTypes' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testType
{
	RCSeriesFilter *filter = [[RCSeriesFilter alloc] init];

	XCTAssertEqual(filter.type, RCAPITypeSeries, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeSeries);
}

@end
