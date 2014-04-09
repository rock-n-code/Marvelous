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

	XCTAssertNil(filter.modifiedSince, @"\"%s\" is expecting the property 'modifiedSince' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
    XCTAssertNil(filter.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.orderBy, @"\"%s\" is expecting the property 'orderBy' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.validOrderTypes, @"\"%s\" is expecting the property 'validOrderTypes' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testValidOrderTypes
{
	RCFilter *filter = [[RCFilter alloc] init];

	XCTAssertNil(filter.validOrderTypes, @"\"%s\" is expecting the property 'validOrderTypes' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testType
{
	RCFilter *filter = [[RCFilter alloc] init];

	XCTAssertEqual(filter.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeUndefined);
}

@end
