//
//  RCListObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCListObject.h"

@interface RCListObjectTests : XCTestCase

@end

@implementation RCListObjectTests

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
	RCListObject *list = [[RCListObject alloc] init];

	XCTAssertNil(list.available, @"\"%s\" is expecting the property 'available' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(list.returned, @"\"%s\" is expecting the property 'returned' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(list.collectionURI, @"\"%s\" is expecting the property 'collectionURI' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(list.items, @"\"%s\" is expecting the property 'items' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyAvailable: @0,
								 RCResponseKeyReturned: @0,
								 RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
								 RCResponseKeyItems: @[@{
									 RCResponseKeyName: @"TestName",
									 RCResponseKeyType: @"TestType",
									 RCResponseKeyRole: @"TestRole",
									 RCResponseKeyResourceURI: @"TestResourceURI"
								 }, @{
									 RCResponseKeyName: @"TestName",
									 RCResponseKeyResourceURI: @"TestResourceURI"
								 }]};

	RCListObject *list = [[RCListObject alloc] initWithDictionary:dictionary];

	XCTAssertNotNil(list.available, @"\"%s\" is expecting the property 'available' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(list.returned, @"\"%s\" is expecting the property 'returned' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(list.collectionURI, @"\"%s\" is expecting the property 'collectionURI' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(list.items, @"\"%s\" is expecting the property 'items' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
