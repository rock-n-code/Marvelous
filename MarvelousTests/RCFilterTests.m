//
//  RCFilterTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCFilter.h"

@interface RCFilterTests : XCTestCase

@end

@implementation RCFilterTests

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
	RCFilter *filter = [[RCFilter alloc] init];

	XCTAssertNil(filter.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
    XCTAssertNil(filter.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(filter.orderBy, RCOrderByTypeCodeUndefined, @"\"%s\" is expecting the property 'orderBy' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCOrderByTypeCodeUndefined);
}

- (void)testParameters
{
	RCFilter *filter = [[RCFilter alloc] init];

	filter.offset = @0;
	filter.limit = @0;
	filter.orderBy = RCOrderByTypeCodeNameAscending;

	NSDictionary *parameters = filter.parameters;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, 3, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value 3.", __PRETTY_FUNCTION__);
}

- (void)testPartialParameters
{
	RCFilter *filter = [[RCFilter alloc] init];

	filter.limit = @0;

	NSDictionary *parameters = filter.parameters;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, 1, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value 1.", __PRETTY_FUNCTION__);
}

@end
