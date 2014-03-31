//
//  RCDataContainerModelTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCDataContainerModel.h"

@interface RCDataContainerModelTests : XCTestCase

@end

@implementation RCDataContainerModelTests

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
	RCDataContainerModel *container = [[RCDataContainerModel alloc] init];

	XCTAssertNil(container.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(container.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(container.total, @"\"%s\" is expecting the property 'copyright' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(container.count, @"\"%s\" is expecting the property 'count' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(container.results, @"\"%s\" is expecting the property 'results' to be NULL.", __PRETTY_FUNCTION__);
}

@end
