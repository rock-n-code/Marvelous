//
//  RCSeriesObjectTests.m
//  Marvelous
//
//  Copyright (c) 2014 Rock & Code [http://rock-n-code.com]
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <XCTest/XCTest.h>

#import "RCSeriesObject.h"
#import "RCResponseKeys.h"

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

- (void)testInitWithPartialDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyIdentifier: @1234,
								 RCResponseKeyDescription: @"TestDescription",
								 RCResponseKeyURLs: @[@{RCResponseKeyType: @"TestType",
														RCResponseKeyURL: @"http://testurl.com"},
													  @{RCResponseKeyType: @"TestAnotherType",
														RCResponseKeyURL: @"http://testanotherurl.com"}],
								 RCResponseKeyEndYear: @2014,
								 RCResponseKeyModified: @"2013-11-20T17:40:18-0500",
								 RCResponseKeyComics: @{RCResponseKeyAvailable: @0,
														RCResponseKeyReturned: @0,
														RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
														RCResponseKeyItems: @[]},
								 RCResponseKeyEvents: @{RCResponseKeyAvailable: @0,
														RCResponseKeyReturned: @0,
														RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
														RCResponseKeyItems: @[]},
								 RCResponseKeyCreators: @{RCResponseKeyAvailable: @0,
														  RCResponseKeyReturned: @0,
														  RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
														  RCResponseKeyItems: @[]},
								 RCResponseKeyNext: @{RCResponseKeyType: @"TestAnotherType",
													  RCResponseKeyURL: @"http://testanotherurl.com"}};

	RCSeriesObject *series = [[RCSeriesObject alloc] initWithDictionary:dictionary];

	XCTAssertNotNil(series.identifier, @"\"%s\" is expecting the property 'identifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.title, @"\"%s\" is expecting the property 'name' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.summary, @"\"%s\" is expecting the property 'bio' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.urls, @"\"%s\" is expecting the property 'urls' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.startYear, @"\"%s\" is expecting the property 'startYear' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.endYear, @"\"%s\" is expecting the property 'endYear' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.rating, @"\"%s\" is expecting the property 'rating' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.lastModified, @"\"%s\" is expecting the property 'lastModified' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.thumbnail, @"\"%s\" is expecting the property 'thumbnail' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.comics, @"\"%s\" is expecting the property 'comics' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.stories, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.events, @"\"%s\" is expecting the property 'events' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.characters, @"\"%s\" is expecting the property 'characters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.creators, @"\"%s\" is expecting the property 'creators' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(series.previous, @"\"%s\" is expecting the property 'previous' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(series.next, @"\"%s\" is expecting the property 'next' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithNil
{
	RCSeriesObject *series = [[RCSeriesObject alloc] initWithDictionary:nil];

	XCTAssertNil(series, @"\"%s\" is expecting the property 'series' to be NULL.", __PRETTY_FUNCTION__);
}

@end
