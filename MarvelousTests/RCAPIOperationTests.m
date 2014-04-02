//
//  RCAPIOperationTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCAPIOperation.h"
#import "RCCharacterFilter.h"
#import "RCMarvelAPITestValues.h"

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
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithCharacterFilterAndAuthentication
{
	RCCharacterFilter *filter = [[RCCharacterFilter alloc] init];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeCharacters, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeCharacters);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeIdentifierAndAuthentication
{
	NSString *identifier = [NSString stringWithFormat:@"%d", RCMarvelAPITestValidValidIdentifier];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:identifier andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeCharacters, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeCharacters);
	XCTAssertNotNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithUndefinedTypeIdentifierAndAuthentication
{
	NSString *identifier = [NSString stringWithFormat:@"%d", RCMarvelAPITestValidValidIdentifier];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeUndefined identifier:identifier andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

@end
