//
//  RCEventObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 02/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCEventObject.h"

@interface RCEventObjectTests : XCTestCase

@end

@implementation RCEventObjectTests

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
	RCEventObject *event = [[RCEventObject alloc] init];

	XCTAssertNil(event.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.title, @"\"%s\" is expecting the property 'name' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.summary, @"\"%s\" is expecting the property 'bio' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.urls, @"\"%s\" is expecting the property 'urls' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.lastModified, @"\"%s\" is expecting the property 'lastModified' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.start, @"\"%s\" is expecting the property 'lastModified' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.end, @"\"%s\" is expecting the property 'lastModified' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.thumbnail, @"\"%s\" is expecting the property 'thumbnail' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.comics, @"\"%s\" is expecting the property 'comics' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.stories, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.series, @"\"%s\" is expecting the property 'events' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.characters, @"\"%s\" is expecting the property 'series' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.creators, @"\"%s\" is expecting the property 'series' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.previous, @"\"%s\" is expecting the property 'series' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(event.next, @"\"%s\" is expecting the property 'series' to be NULL.", __PRETTY_FUNCTION__);
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
								 RCResponseKeyModified: @"2013-11-20T17:40:18-0500",
								 RCResponseKeyStart: @"2014-01-01T00:00:00-0500",
								 RCResponseKeyEnd: @"2014-02-01T00:00:00-0500",
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
								 RCResponseKeySeries: @{RCResponseKeyAvailable: @0,
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

	RCEventObject *event = [[RCEventObject alloc] initWithDictionary:dictionary];

	XCTAssertNotNil(event.identifier, @"\"%s\" is expecting the property 'identifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.title, @"\"%s\" is expecting the property 'title' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.summary, @"\"%s\" is expecting the property 'summary' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.urls, @"\"%s\" is expecting the property 'urls' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.lastModified, @"\"%s\" is expecting the property 'lastModified' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.start, @"\"%s\" is expecting the property 'start' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.end, @"\"%s\" is expecting the property 'end' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.thumbnail, @"\"%s\" is expecting the property 'thumbnail' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.comics, @"\"%s\" is expecting the property 'comics' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.stories, @"\"%s\" is expecting the property 'stories' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.series, @"\"%s\" is expecting the property 'series' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.characters, @"\"%s\" is expecting the property 'characters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.creators, @"\"%s\" is expecting the property 'creators' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.previous, @"\"%s\" is expecting the property 'previous' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(event.next, @"\"%s\" is expecting the property 'next' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
