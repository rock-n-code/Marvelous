//
//  RCTextObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 07/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCTextObject.h"

@interface RCTextObjectTests : XCTestCase

@end

@implementation RCTextObjectTests

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
	RCTextObject *object = [[RCTextObject alloc] init];

	XCTAssertNil(object.type, @"\"%s\" is expecting the property 'type' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(object.language, @"\"%s\" is expecting the property 'language' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(object.text, @"\"%s\" is expecting the property 'text' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyType: @"TestType",
								 RCResponseKeyLanguage: @"TestLanguage",
								 RCResponseKeyText: @"TestText"};

	RCTextObject *object = [[RCTextObject alloc] initWithDictionary:dictionary];

	XCTAssertNotNil(object.type, @"\"%s\" is expecting the property 'type' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(object.language, @"\"%s\" is expecting the property 'language' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(object.text, @"\"%s\" is expecting the property 'text' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
