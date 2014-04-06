//
//  RCSeriesObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCSeriesObject.h"

@interface RCSeriesObjectTests : XCTestCase

@end

@implementation RCSeriesObjectTests

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
	RCSeriesObject *series = [[RCSeriesObject alloc] init];

	XCTAssertNil(series.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.title, @"\"%s\" is expecting the property 'name' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.summary, @"\"%s\" is expecting the property 'bio' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.urls, @"\"%s\" is expecting the property 'urls' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.startYear, @"\"%s\" is expecting the property 'startYear' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.endYear, @"\"%s\" is expecting the property 'endYear' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.rating, @"\"%s\" is expecting the property 'rating' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.lastModified, @"\"%s\" is expecting the property 'lastModified' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.thumbnail, @"\"%s\" is expecting the property 'thumbnail' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.comics, @"\"%s\" is expecting the property 'comics' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.stories, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.events, @"\"%s\" is expecting the property 'events' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.characters, @"\"%s\" is expecting the property 'characters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.creators, @"\"%s\" is expecting the property 'creators' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.previous, @"\"%s\" is expecting the property 'previous' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.next, @"\"%s\" is expecting the property 'next' to be NULL.", __PRETTY_FUNCTION__);
}

@end
