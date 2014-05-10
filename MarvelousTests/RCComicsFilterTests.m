//
//  RCComicFilterTests.m
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

#import "RCComicsFilter.h"

@interface RCComicsFilterTests : XCTestCase

@end

@implementation RCComicsFilterTests

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
    RCComicsFilter *filter = [[RCComicsFilter alloc] init];

	XCTAssertEqual(filter.format, RCIssueFormatCodeUndefined, @"\"%s\" is expecting the property 'format' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)RCIssueFormatCodeUndefined);
	XCTAssertEqual(filter.formatType, RCIssueTypeCodeUndefined, @"\"%s\" is expecting the property 'formatType' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)RCIssueTypeCodeUndefined);
	XCTAssertEqual(filter.noVariants, RCBooleanValueCodeUndefined, @"\"%s\" is expecting the property 'noVariants' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)RCBooleanValueCodeUndefined);
	XCTAssertEqual(filter.dateDescriptor, RCDateDescriptorCodeUndefined, @"\"%s\" is expecting the property 'dateDescriptor' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)RCDateDescriptorCodeUndefined);
	XCTAssertNil(filter.dateRange, @"\"%s\" is expecting the property 'dateRange' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.title, @"\"%s\" is expecting the property 'title' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.titleStartsWith, @"\"%s\" is expecting the property 'titleStartsWith' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.issueNumber, @"\"%s\" is expecting the property 'issueNumber' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.startYear, @"\"%s\" is expecting the property 'startYear' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.diamondCode, @"\"%s\" is expecting the property 'diamondCode' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.digitalIdentifier, @"\"%s\" is expecting the property 'digitalIdentifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.upc, @"\"%s\" is expecting the property 'upc' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.isbn, @"\"%s\" is expecting the property 'isbn' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.ean, @"\"%s\" is expecting the property 'ean' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.issn, @"\"%s\" is expecting the property 'issn' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(filter.hasDigitalIssue, RCBooleanValueCodeUndefined, @"\"%s\" is expecting the property 'hasDigitalIssue' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)RCBooleanValueCodeUndefined);
	XCTAssertNil(filter.creators, @"\"%s\" is expecting the property 'creators' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.characters, @"\"%s\" is expecting the property 'characters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.series, @"\"%s\" is expecting the property 'series' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.events, @"\"%s\" is expecting the property 'events' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.stories, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.sharedAppearances, @"\"%s\" is expecting the property 'sharedAppearances' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.collaborators, @"\"%s\" is expecting the property 'collaborators' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
    XCTAssertNil(filter.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.orderBy, @"\"%s\" is expecting the property 'orderBy' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(filter.validOrderTypes, @"\"%s\" is expecting the property 'validOrderTypes' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testParameters
{
	NSDate *today = [NSDate date];
	RCComicsFilter *filter = [[RCComicsFilter alloc] init];

	filter.format = RCIssueFormatCodeComic;
	filter.formatType = RCIssueTypeCodeComic;
	filter.noVariants = RCBooleanValueCodeTrue;
	filter.dateDescriptor = RCDateDescriptorCodeThisWeek;
	filter.dateRange = @[today, today];
	filter.title = @"TestTitle";
	filter.titleStartsWith = @"TestTitleStartsWith";
	filter.issueNumber = @1;
	filter.startYear = @1234;
	filter.diamondCode = @"TestDiamondCode";
	filter.digitalIdentifier = @1234;
	filter.upc = @"TestUPC";
	filter.isbn = @"TestISBN";
	filter.ean = @"TestEAN";
	filter.issn = @"TestISSN";
	filter.hasDigitalIssue = RCBooleanValueCodeFalse;
	filter.modifiedSince = today;
	filter.creators = @[@0, @1, @2];
	filter.characters = @[@"0", @"1", @"2"];
	filter.series = @[@"0", @"1", @"2"];
	filter.events = @[@0, @1, @2];
	filter.stories = @[@"0", @"1", @"2"];
	filter.sharedAppearances = @[@2, @4, @6];
	filter.offset = @0;
	filter.limit = @0;
	filter.orderBy = @[@(RCOrderByTypeCodeFinalOrderCutoffDateDescending), @(RCOrderByTypeCodeIssueNumberAscending)];

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 26;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testPartialParameters
{
	RCComicsFilter *filter = [[RCComicsFilter alloc] init];

	filter.format = RCIssueFormatCodeComic;
	filter.digitalIdentifier = @1234;
	filter.title = @"TestTitle";
	filter.issueNumber = @1;
	filter.upc = @"TestUPC";
	filter.issn = @"TestISSN";
	filter.series = @[@"0", @"1", @"2"];
	filter.sharedAppearances = @[@2, @4, @6];
	filter.offset = @0;
	filter.limit = @0;
	filter.orderBy = @[@(RCOrderByTypeCodeIssueNumberDescending)];

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 11;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testValidOrderTypes
{
	RCComicsFilter *filter = [[RCComicsFilter alloc] init];
	NSInteger countToTest = 10;

	XCTAssertEqual(filter.validOrderTypes.count, countToTest, @"\"%s\" is expecting the property 'count' of the property 'validOrderTypes' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testType
{
	RCComicsFilter *filter = [[RCComicsFilter alloc] init];

	XCTAssertEqual(filter.type, RCAPITypeComics, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeComics);
}

@end
