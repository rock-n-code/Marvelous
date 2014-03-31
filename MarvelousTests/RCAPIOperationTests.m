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

	XCTAssertEqual(operation.type, RCAPIOperationTypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPIOperationTypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.publicKey, @"\"%s\" is expecting the property 'publicKey' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.json, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypePublicKeyAndIdentifier
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPIOperationTypeUndefined identifier:RCAPIOperationTestValueIdentifier andPublicKey:RCAPIOperationTestValuePublicKey];

	XCTAssertEqual(operation.type, RCAPIOperationTypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPIOperationTypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.publicKey, @"\"%s\" is expecting the property 'publicKey' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.json, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

@end
