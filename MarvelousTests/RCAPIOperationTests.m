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
}

@end
