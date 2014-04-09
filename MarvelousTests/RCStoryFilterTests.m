//
//  RCStoryFilterTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCStoryFilter.h"

@interface RCStoryFilterTests : XCTestCase

@end

@implementation RCStoryFilterTests

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
    RCStoryFilter *filter = [[RCStoryFilter alloc] init];

	XCTAssertNil(filter.modifiedSince, @"\"%s\" is expecting the property 'modifiedSince' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.comics, @"\"%s\" is expecting the property 'comics' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.series, @"\"%s\" is expecting the property 'series' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.events, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.creators, @"\"%s\" is expecting the property 'creators' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.characters, @"\"%s\" is expecting the property 'creators' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
    XCTAssertNil(filter.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.orderBy, @"\"%s\" is expecting the property 'orderBy' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(filter.validOrderTypes, @"\"%s\" is expecting the property 'validOrderTypes' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testParameters
{
	RCStoryFilter *filter = [[RCStoryFilter alloc] init];

	filter.modifiedSince = [NSDate date];
	filter.comics = @[@0, @1, @2];
	filter.series = @[@"0", @"1", @"2"];
	filter.events = @[@"0", @"1", @"2"];
	filter.creators = @[@0, @1, @2];
	filter.characters = @[@"0", @"2", @"4"];
	filter.offset = @0;
	filter.limit = @0;
	filter.orderBy = @[@(RCOrderByTypeCodeIdentifierAscending)];

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 9;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testPartialParameters
{
	RCStoryFilter *filter = [[RCStoryFilter alloc] init];

	filter.comics = @[@0, @2, @4];
	filter.events = @[@"0", @"2", @"4"];
	filter.limit = @0;
	filter.series = @[@"0", @"1", @"2"];
	filter.orderBy = @[@(RCOrderByTypeCodeDateModifiedAscending)];

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 5;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testValidOrderTypes
{
	RCStoryFilter *filter = [[RCStoryFilter alloc] init];
	NSInteger countToTest = 4;

	XCTAssertEqual(filter.validOrderTypes.count, countToTest, @"\"%s\" is expecting the property 'count' of the property 'validOrderTypes' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testType
{
	RCStoryFilter *filter = [[RCStoryFilter alloc] init];

	XCTAssertEqual(filter.type, RCAPITypeStories, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeStories);
}

@end
