//
//  RCDataWrapperObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCDataWrapperObject.h"
#import "RCResponseKeys.h"

@interface RCDataWrapperObjectTests : XCTestCase

@end

@implementation RCDataWrapperObjectTests

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
	RCDataWrapperObject *wrapper = [[RCDataWrapperObject alloc] init];

	XCTAssertNil(wrapper.code, @"\"%s\" is expecting the property 'code' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.status, @"\"%s\" is expecting the property 'status' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.copyright, @"\"%s\" is expecting the property 'copyright' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.attributionText, @"\"%s\" is expecting the property 'attributionText' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.attributionHTML, @"\"%s\" is expecting the property 'attributionHTML' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.data, @"\"%s\" is expecting the property 'data' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.etag, @"\"%s\" is expecting the property 'etag' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeAndDictionary
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
	
	RCDataWrapperObject *wrapper = [[RCDataWrapperObject alloc] initWithType:RCAPITypeCharacters andDictionary:dictionary];

	XCTAssertNotNil(wrapper.code, @"\"%s\" is expecting the property 'code' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.status, @"\"%s\" is expecting the property 'status' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.copyright, @"\"%s\" is expecting the property 'copyright' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.attributionText, @"\"%s\" is expecting the property 'attributionText' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.attributionHTML, @"\"%s\" is expecting the property 'attributionHTML' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.data, @"\"%s\" is expecting the property 'data' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.etag, @"\"%s\" is expecting the property 'etag' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
