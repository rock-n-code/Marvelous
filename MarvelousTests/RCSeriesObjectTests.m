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

- (void)testInitWithDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyIdentifier: @1234,
								 RCResponseKeyTitle: @"TestName",
								 RCResponseKeyDescription: @"TestDescription",
								 RCResponseKeyResourceURI: @"http://testcollectionuri.com",
								 RCResponseKeyURLs: @[@{RCResponseKeyType: @"TestType",
														RCResponseKeyURL: @"http://testurl.com"},
													  @{RCResponseKeyType: @"TestAnotherType",
														RCResponseKeyURL: @"http://testanotherurl.com"}],
								 RCResponseKeyStartYear: @2013,
								 RCResponseKeyEndYear: @2014,
								 RCResponseKeyRating: @"TestRating",
								 RCResponseKeyModified: @"2013-11-20T17:40:18-0500",
								 RCResponseKeyThumbnail: @{RCResponseKeyPath: @"http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73",
														   RCResponseKeyExtension: @"jpg"},
								 RCResponseKeyComics: @{RCResponseKeyAvailable: @0,
														RCResponseKeyReturned: @0,
														RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
														RCResponseKeyItems: @[]},
								 RCResponseKeyStories: @{RCResponseKeyAvailable: @0,
														 RCResponseKeyReturned: @0,
														 RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
														 RCResponseKeyItems: @[]},
								 RCResponseKeyEvents: @{RCResponseKeyAvailable: @0,
														RCResponseKeyReturned: @0,
														RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
														RCResponseKeyItems: @[]},
								 RCResponseKeyCharacters: @{RCResponseKeyAvailable: @0,
															RCResponseKeyReturned: @0,
															RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
															RCResponseKeyItems: @[]},
								 RCResponseKeyCreators: @{RCResponseKeyAvailable: @0,
														  RCResponseKeyReturned: @0,
														  RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
														  RCResponseKeyItems: @[]},
								 RCResponseKeyPrevious: @{RCResponseKeyType: @"TestAnotherType",
														  RCResponseKeyURL: @"http://testanotherurl.com"},
								 RCResponseKeyNext: @{RCResponseKeyType: @"TestAnotherType",
													  RCResponseKeyURL: @"http://testanotherurl.com"}};

	RCSeriesObject *series = [[RCSeriesObject alloc] initWithDictionary:dictionary];

	XCTAssertNotNil(series.identifier, @"\"%s\" is expecting the property 'identifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.title, @"\"%s\" is expecting the property 'name' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.summary, @"\"%s\" is expecting the property 'bio' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.urls, @"\"%s\" is expecting the property 'urls' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.startYear, @"\"%s\" is expecting the property 'startYear' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.endYear, @"\"%s\" is expecting the property 'endYear' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.rating, @"\"%s\" is expecting the property 'rating' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.lastModified, @"\"%s\" is expecting the property 'lastModified' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.thumbnail, @"\"%s\" is expecting the property 'thumbnail' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.comics, @"\"%s\" is expecting the property 'comics' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.stories, @"\"%s\" is expecting the property 'stories' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.events, @"\"%s\" is expecting the property 'events' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.characters, @"\"%s\" is expecting the property 'characters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.creators, @"\"%s\" is expecting the property 'creators' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.previous, @"\"%s\" is expecting the property 'previous' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.next, @"\"%s\" is expecting the property 'next' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
