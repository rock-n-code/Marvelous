//
//  RCSummaryModelTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCSummaryModel.h"

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
	RCSummaryModel *summary = [[RCSummaryModel alloc] init];

	XCTAssertNil(summary.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(summary.name, @"\"%s\" is expecting the property 'name' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(summary.type, @"\"%s\" is expecting the property 'type' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(summary.role, @"\"%s\" is expecting the property 'role' to be NULL.", __PRETTY_FUNCTION__);
}


@end
