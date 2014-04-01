//
//  RCQueryInfoObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCQueryInfoObject.h"

@interface RCQueryInfoObjectTests : XCTestCase

@end

@implementation RCQueryInfoObjectTests

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
	RCQueryInfoObject *info = [[RCQueryInfoObject alloc] init];

	XCTAssertNil(info.copyright, @"\"%s\" is expecting the property 'copyright' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.attributionText, @"\"%s\" is expecting the property 'attributionText' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.attributionHTML, @"\"%s\" is expecting the property 'attributionHTML' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.etag, @"\"%s\" is expecting the property 'etag' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.total, @"\"%s\" is expecting the property 'total' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.count, @"\"%s\" is expecting the property 'count' to be NULL.", __PRETTY_FUNCTION__);
}

@end
