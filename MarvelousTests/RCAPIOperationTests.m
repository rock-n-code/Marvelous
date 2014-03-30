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

- (void)testStartWithNilURLAndFilter
{
	RCAPIOperation *operation = [[RCAPIOperation alloc] init];

	[operation start];

	XCTAssertTrue(operation.isFinished, @"\"%s\" is expecting the property 'isFinished' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testStartWithNilURL
{
	NSDictionary *filter = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithURL:nil andFilter:filter];

	[operation start];

	XCTAssertTrue(operation.isFinished, @"\"%s\" is expecting the property 'isFinished' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testStartWithNilFilter
{
	NSURL *url = [NSURL URLWithString:@""];
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithURL:url andFilter:nil];

	[operation start];

	XCTAssertTrue(operation.isFinished, @"\"%s\" is expecting the property 'isFinished' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testCancel
{
	NSURL *url = [NSURL URLWithString:@""];
	NSDictionary *filter = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithURL:url andFilter:filter];

	[operation start];
	[operation cancel];

	XCTAssertTrue(operation.isFinished, @"\"%s\" is expecting the property 'isFinished' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertTrue(operation.isCancelled, @"\"%s\" is expecting the property 'isCancelled' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
