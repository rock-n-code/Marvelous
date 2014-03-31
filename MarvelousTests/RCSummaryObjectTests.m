//
//  RCSummaryObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCSummaryObject.h"

@interface RCSummaryModelTests : XCTestCase

@end

@implementation RCSummaryModelTests

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
	RCSummaryObject *summary = [[RCSummaryObject alloc] init];

	XCTAssertNil(summary.name, @"\"%s\" is expecting the property 'name' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(summary.type, @"\"%s\" is expecting the property 'type' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(summary.role, @"\"%s\" is expecting the property 'role' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(summary.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyName: @"TestName",
								 RCResponseKeyType: @"TestType",
								 RCResponseKeyRole: @"TestRole",
								 RCResponseKeyResourceURI: @"TestResourceURI"};

	RCSummaryObject *summary = [[RCSummaryObject alloc] initWithDictionary:dictionary];

	XCTAssertNotNil(summary.name, @"\"%s\" is expecting the property 'name' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(summary.type, @"\"%s\" is expecting the property 'type' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(summary.role, @"\"%s\" is expecting the property 'role' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(summary.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithPartialDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyName: @"TestName",
								 RCResponseKeyType: @"TestType",
								 RCResponseKeyResourceURI: @"TestResourceURI"};

	RCSummaryObject *summary = [[RCSummaryObject alloc] initWithDictionary:dictionary];

	XCTAssertNotNil(summary.name, @"\"%s\" is expecting the property 'name' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(summary.type, @"\"%s\" is expecting the property 'type' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(summary.role, @"\"%s\" is expecting the property 'role' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(summary.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
