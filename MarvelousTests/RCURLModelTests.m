//
//  RCURLModelTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCURLModel.h"

@interface RCURLModelTests : XCTestCase

@end

@implementation RCURLModelTests

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
	RCURLModel *url = [[RCURLModel alloc] init];

	XCTAssertNil(url.type, @"\"%s\" is expecting the property 'type' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(url.absoluteString, @"\"%s\" is expecting the property 'absoluteString' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(url.absoluteURL, @"\"%s\" is expecting the property 'absoluteURL' to be NULL.", __PRETTY_FUNCTION__);
}

@end
