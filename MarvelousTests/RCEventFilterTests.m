//
//  RCEventFilterTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 02/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCEventFilter.h"

@interface RCEventFilterTests : XCTestCase

@end

@implementation RCEventFilterTests

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
    RCEventFilter *filter = [[RCEventFilter alloc] init];

	XCTAssertNil(filter.name, @"\"%s\" is expecting the property 'name' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.nameStartsWith, @"\"%s\" is expecting the property 'nameStartsWith' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.modifiedSince, @"\"%s\" is expecting the property 'modifiedSince' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.comics, @"\"%s\" is expecting the property 'comics' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.series, @"\"%s\" is expecting the property 'series' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.stories, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.creators, @"\"%s\" is expecting the property 'creators' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
    XCTAssertNil(filter.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(filter.orderBy, RCOrderByTypeCodeUndefined, @"\"%s\" is expecting the property 'orderBy' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCOrderByTypeCodeUndefined);
}

- (void)testParameters
{
	RCEventFilter *filter = [[RCEventFilter alloc] init];

	filter.name = @"TestName";
	filter.nameStartsWith = @"TestNameStartsWith";
	filter.modifiedSince = [NSDate date];
	filter.comics = @[@0, @1, @2];
	filter.series = @[@"0", @"1", @"2"];
	filter.stories = @[@"0", @"1", @"2"];
	filter.creators = @[@0, @1, @2];
	filter.offset = @0;
	filter.limit = @0;
	filter.orderBy = RCOrderByTypeCodeNameAscending;

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 10;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %d.", __PRETTY_FUNCTION__, countToTest);
}

- (void)testPartialParameters
{
	RCEventFilter *filter = [[RCEventFilter alloc] init];

	filter.name = @"TestName";
	filter.limit = @0;
	filter.series = @[@"0", @"1", @"2"];
	filter.orderBy = RCOrderByTypeCodeNameDescending;

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 4;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %d.", __PRETTY_FUNCTION__, countToTest);
}

- (void)testType
{
	RCEventFilter *filter = [[RCEventFilter alloc] init];

	XCTAssertEqual(filter.type, RCAPITypeEvents, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeEvents);
}

@end
