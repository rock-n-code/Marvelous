//
//  RCSeriesFilterTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCSeriesFilter.h"

@interface RCSeriesFilterTests : XCTestCase

@end

@implementation RCSeriesFilterTests

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
    RCSeriesFilter *filter = [[RCSeriesFilter alloc] init];

	XCTAssertNil(filter.title, @"\"%s\" is expecting the property 'title' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.titleStartsWith, @"\"%s\" is expecting the property 'titleStartsWith' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.startYear, @"\"%s\" is expecting the property 'startYear' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.modifiedSince, @"\"%s\" is expecting the property 'modifiedSince' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.comics, @"\"%s\" is expecting the property 'comics' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.stories, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.events, @"\"%s\" is expecting the property 'events' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.creators, @"\"%s\" is expecting the property 'creators' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.characters, @"\"%s\" is expecting the property 'characters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(filter.seriesType, RCSeriesTypeCodeUndefined, @"\"%s\" is expecting the property 'count' of the property 'validOrderTypes' to be the integer value %d.", __PRETTY_FUNCTION__, RCSeriesTypeCodeUndefined);
	XCTAssertNil(filter.contains, @"\"%s\" is expecting the property 'contains' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
    XCTAssertNil(filter.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.orderBy, @"\"%s\" is expecting the property 'orderBy' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(filter.validOrderTypes, @"\"%s\" is expecting the property 'validOrderTypes' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
