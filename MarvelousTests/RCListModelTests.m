//
//  RCListModelTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCListModel.h"

@interface RCListModelTests : XCTestCase

@end

@implementation RCListModelTests

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
	RCListModel *list = [[RCListModel alloc] init];

	XCTAssertNil(list.available, @"\"%s\" is expecting the property 'available' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(list.returned, @"\"%s\" is expecting the property 'returned' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(list.collectionURI, @"\"%s\" is expecting the property 'collectionURI' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(list.items, @"\"%s\" is expecting the property 'items' to be NULL.", __PRETTY_FUNCTION__);
}


@end
