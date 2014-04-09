//
//  RCComicFilterTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
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

	XCTAssertEqual(filter.format, RCFormatTypeCodeUndefined, @"\"%s\" is expecting the property 'format' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)RCFormatTypeCodeUndefined);
	XCTAssertEqual(filter.formatType, RCIssueTypeCodeUndefined, @"\"%s\" is expecting the property 'formatType' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)RCIssueTypeCodeUndefined);
	XCTAssertEqual(filter.noVariants, RCBooleanValueCodeUndefined, @"\"%s\" is expecting the property 'noVariants' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)RCBooleanValueCodeUndefined);
	XCTAssertEqual(filter.dateDescriptor, RCDateDescriptorCodeUndefined, @"\"%s\" is expecting the property 'dateDescriptor' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)RCDateDescriptorCodeUndefined);
	XCTAssertNil(filter.dateRange, @"\"%s\" is expecting the property 'dateRange' to be NULL.", __PRETTY_FUNCTION__);
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

	filter.format = RCFormatTypeCodeComic;
	filter.formatType = RCIssueTypeCodeComic;
	filter.noVariants = RCBooleanValueCodeTrue;
	filter.dateDescriptor = RCDateDescriptorCodeThisWeek;
	filter.dateRange = @[today, today];
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
	NSInteger countToTest = 22;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testPartialParameters
{
	RCComicsFilter *filter = [[RCComicsFilter alloc] init];

	filter.format = RCFormatTypeCodeComic;
	filter.digitalIdentifier = @1234;
	filter.upc = @"TestUPC";
	filter.issn = @"TestISSN";
	filter.series = @[@"0", @"1", @"2"];
	filter.sharedAppearances = @[@2, @4, @6];
	filter.offset = @0;
	filter.limit = @0;
	filter.orderBy = @[@(RCOrderByTypeCodeIssueNumberDescending)];

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 9;

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
