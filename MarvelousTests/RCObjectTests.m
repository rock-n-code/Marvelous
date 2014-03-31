//
//  RCObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCObject.h"

@interface RCObjectTests : XCTestCase

@end

@implementation RCObjectTests

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
	RCObject *object = [[RCObject alloc] init];

	XCTAssertNotNil(object, @"\"%s\" is expecting the 'object' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithDictionary
{
	RCObject *object = [[RCObject alloc] initWithDictionary:@{}];

	XCTAssertNotNil(object, @"\"%s\" is expecting the 'object' to be NULL.", __PRETTY_FUNCTION__);
}

@end
