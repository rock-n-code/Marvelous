//
//  RCCreatorFilterTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCCreatorFilter.h"

@interface RCCreatorFilterTests : XCTestCase

@end

@implementation RCCreatorFilterTests

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
    RCCreatorFilter *filter = [[RCCreatorFilter alloc] init];

	XCTAssertNil(filter.firstName, @"\"%s\" is expecting the property 'firstName' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.middleName, @"\"%s\" is expecting the property 'middleName' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.lastName, @"\"%s\" is expecting the property 'lastName' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.suffix, @"\"%s\" is expecting the property 'suffix' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.nameStartsWith, @"\"%s\" is expecting the property 'nameStartsWith' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.firstNameStartsWith, @"\"%s\" is expecting the property 'firstNameStartsWith' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.middleNameStartsWith, @"\"%s\" is expecting the property 'middleNameStartsWith' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.lastNameStartsWith, @"\"%s\" is expecting the property 'lastNameStartsWith' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.modifiedSince, @"\"%s\" is expecting the property 'modifiedSince' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.comics, @"\"%s\" is expecting the property 'comics' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.series, @"\"%s\" is expecting the property 'series' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.events, @"\"%s\" is expecting the property 'events' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.stories, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
    XCTAssertNil(filter.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.orderBy, @"\"%s\" is expecting the property 'orderBy' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(filter.validOrderTypes, @"\"%s\" is expecting the property 'validOrderTypes' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testParameters
{
	RCCreatorFilter *filter = [[RCCreatorFilter alloc] init];

	filter.firstName = @"TestFistName";
	filter.middleName = @"TestMiddleName";
	filter.lastName = @"TestLastName";
	filter.suffix = @"TestSuffix";
	filter.nameStartsWith = @"TestNameStartsWith";
	filter.firstNameStartsWith = @"TestFirstNameStartsWith";
	filter.middleNameStartsWith = @"TestMiddleNameStartsWith";
	filter.lastNameStartsWith = @"TestLastNameStartsWith";
	filter.modifiedSince = [NSDate date];
	filter.comics = @[@0, @1, @2];
	filter.series = @[@"0", @"1", @"2"];
	filter.events = @[@0, @1, @2];
	filter.stories = @[@"0", @"1", @"2"];
	filter.offset = @0;
	filter.limit = @0;
	filter.orderBy = @[@(RCOrderByTypeCodeDateModifiedAscending)];

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 16;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %d.", __PRETTY_FUNCTION__, countToTest);
}

- (void)testPartialParameters
{
	RCCreatorFilter *filter = [[RCCreatorFilter alloc] init];

	filter.firstName = @"TestFirstName";
	filter.lastNameStartsWith = @"TestLastNameStartsWith";
	filter.series = @[@"0", @"1", @"2"];
	filter.limit = @0;
	filter.orderBy = @[@(RCOrderByTypeCodeDateModifiedDescending)];

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 5;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %d.", __PRETTY_FUNCTION__, countToTest);
}

- (void)testType
{
	RCCreatorFilter *filter = [[RCCreatorFilter alloc] init];

	XCTAssertEqual(filter.type, RCAPITypeCreators, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeCreators);
}

@end
