//
//  RCComicFilterTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCComicFilter.h"

@interface RCComicFilterTests : XCTestCase

@end

@implementation RCComicFilterTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testValidOrderTypes
{
	RCComicFilter *filter = [[RCComicFilter alloc] init];
	NSInteger countToTest = 10;

	XCTAssertEqual(filter.validOrderTypes.count, countToTest, @"\"%s\" is expecting the property 'count' of the property 'validOrderTypes' to be the integer value %d.", __PRETTY_FUNCTION__, countToTest);
}

- (void)testType
{
	RCComicFilter *filter = [[RCComicFilter alloc] init];

	XCTAssertEqual(filter.type, RCAPITypeComics, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeComics);
}

@end
