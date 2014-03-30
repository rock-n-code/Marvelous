//
//  RCAPIOperationTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCAPIOperation.h"

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
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.json, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithURL
{
	NSURL *url = [NSURL URLWithString:@""];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithURL:url andFilter:nil];

	XCTAssertEqual(operation.type, RCAPIOperationTypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPIOperationTypeUndefined);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to have a URL instance.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.json, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithFilter
{
	NSDictionary *filter = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithURL:nil andFilter:filter];

	XCTAssertEqual(operation.type, RCAPIOperationTypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPIOperationTypeUndefined);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.filter, @"\"%s\" is expecting the property 'filter' to have a NSDictionary instance.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.json, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithURLAndFilter
{
	NSURL *url = [NSURL URLWithString:@""];
	NSDictionary *filter = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithURL:url andFilter:filter];

	XCTAssertEqual(operation.type, RCAPIOperationTypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPIOperationTypeUndefined);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to have a URL instance.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.filter, @"\"%s\" is expecting the property 'filter' to have a NSDictionary instance.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.json, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
}

}

@end
