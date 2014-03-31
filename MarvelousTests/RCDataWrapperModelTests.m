//
//  RCDataWrapperModelTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCDataWrapperModel.h"

@interface RCDataWrapperModelTests : XCTestCase

@end

@implementation RCDataWrapperModelTests

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
	RCDataWrapperModel *wrapper = [[RCDataWrapperModel alloc] init];

	XCTAssertNil(wrapper.code, @"\"%s\" is expecting the property 'code' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.status, @"\"%s\" is expecting the property 'status' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.copyright, @"\"%s\" is expecting the property 'copyright' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.attributionText, @"\"%s\" is expecting the property 'attributionText' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.attributionHTML, @"\"%s\" is expecting the property 'attributionHTML' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.data, @"\"%s\" is expecting the property 'data' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.etag, @"\"%s\" is expecting the property 'etag' to be NULL.", __PRETTY_FUNCTION__);
}

@end
