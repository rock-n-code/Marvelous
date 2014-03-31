//
//  RCURLObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCURLObject.h"

@interface RCURLObjectTests : XCTestCase

@end

@implementation RCURLObjectTests

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
	RCURLObject *url = [[RCURLObject alloc] init];

	XCTAssertNil(url.type, @"\"%s\" is expecting the property 'type' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(url.absoluteString, @"\"%s\" is expecting the property 'absoluteString' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(url.absoluteURL, @"\"%s\" is expecting the property 'absoluteURL' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyType: @"TestType",
								 RCResponseKeyURL: @"http://testurl.com"};

	RCURLObject *url = [[RCURLObject alloc] initWithDictionary:dictionary];

	XCTAssertNotNil(url.type, @"\"%s\" is expecting the property 'type' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(url.absoluteString, @"\"%s\" is expecting the property 'absoluteString' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(url.absoluteURL, @"\"%s\" is expecting the property 'absoluteURL' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
