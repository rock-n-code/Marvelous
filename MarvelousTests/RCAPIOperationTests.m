//
//  RCAPIOperationTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCAPIOperation.h"
#import "RCAPIOperationTestValues.h"

@interface RCAPIOperationTests : XCTestCase

@end

@implementation RCAPIOperationTests

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
	RCAPIOperation *operation = [[RCAPIOperation alloc] init];

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeIdentifierAndAuthentication
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:RCAPIOperationTestValueValidIdentifier andAuthentication:@{}];

	XCTAssertEqual(operation.type, RCAPITypeCharacters, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeCharacters);
	XCTAssertNotNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithUndefinedTypeIdentifierAndAuthentication
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeUndefined identifier:RCAPIOperationTestValueValidIdentifier andAuthentication:@{}];

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

@end
