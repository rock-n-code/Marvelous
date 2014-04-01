//
//  RCQueryInfoObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCQueryInfoObject.h"
#import "RCResponseKeys.h"

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

- (void)testInitWithDataWrapper
{
	NSDictionary *dictionary = @{RCResponseKeyCode: @0,
								 RCResponseKeyStatus: @"TestStatus",
								 RCResponseKeyCopyright: @"TestCopyright",
								 RCResponseKeyAttributionText: @"TestAttributionText",
								 RCResponseKeyAttributionHTML: @"TestAttributionHTML",
								 RCResponseKeyData: @{RCResponseKeyOffset: @0,
													  RCResponseKeyLimit: @0,
													  RCResponseKeyTotal: @0,
													  RCResponseKeyCount: @0,
													  RCResponseKeyResults: @[]},
								 RCResponseKeyETag: @"TestEtag"};

	RCDataWrapperObject *dataWrapper = [[RCDataWrapperObject alloc] initWithType:RCAPITypeCharacters andDictionary:dictionary];
	RCQueryInfoObject *info = [[RCQueryInfoObject alloc] initWithDataWrapper:dataWrapper];

	XCTAssertNotNil(info.copyright, @"\"%s\" is expecting the property 'copyright' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.attributionText, @"\"%s\" is expecting the property 'attributionText' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.attributionHTML, @"\"%s\" is expecting the property 'attributionHTML' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.etag, @"\"%s\" is expecting the property 'etag' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.offset, @"\"%s\" is expecting the property 'offset' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.limit, @"\"%s\" is expecting the property 'limit' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.total, @"\"%s\" is expecting the property 'total' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.count, @"\"%s\" is expecting the property 'count' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
