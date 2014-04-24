//
//  RCCreatorObjectTests.m
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

#import "RCCreatorObject.h"
#import "RCResponseKeys.h"

@interface RCCreatorObjectTests : XCTestCase

@end

@implementation RCCreatorObjectTests

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
	RCCreatorObject *creator = [[RCCreatorObject alloc] init];

	XCTAssertNil(creator.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.firstName, @"\"%s\" is expecting the property 'firstName' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.middleName, @"\"%s\" is expecting the property 'middleName' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.lastName, @"\"%s\" is expecting the property 'lastName' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.suffix, @"\"%s\" is expecting the property 'suffix' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.fullName, @"\"%s\" is expecting the property 'fullName' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.lastModified, @"\"%s\" is expecting the property 'lastModified' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.urls, @"\"%s\" is expecting the property 'urls' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.thumbnail, @"\"%s\" is expecting the property 'thumbnail' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.comics, @"\"%s\" is expecting the property 'comics' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.stories, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.series, @"\"%s\" is expecting the property 'events' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.events, @"\"%s\" is expecting the property 'events' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyIdentifier: @1234,
								 RCResponseKeyFirstName: @"TestFirstName",
								 RCResponseKeyMiddleName: @"TestMiddleName",
								 RCResponseKeyLastName: @"TestLastName",
								 RCResponseKeySuffix: @"TestSuffix",
								 RCResponseKeyFullName: @"TestFullName",
								 RCResponseKeyModified: @"2013-11-20T17:40:18-0500",
								 RCResponseKeyResourceURI: @"http://testcollectionuri.com",
								 RCResponseKeyURLs: @[@{RCResponseKeyType: @"TestType",
														RCResponseKeyURL: @"http://testurl.com"},
													  @{RCResponseKeyType: @"TestAnotherType",
														RCResponseKeyURL: @"http://testanotherurl.com"}],
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
								 RCResponseKeyEvents: @{RCResponseKeyAvailable: @0,
														RCResponseKeyReturned: @0,
														RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
														RCResponseKeyItems: @[]}};

	RCCreatorObject *creator = [[RCCreatorObject alloc] initWithDictionary:dictionary];

	XCTAssertNotNil(creator.identifier, @"\"%s\" is expecting the property 'identifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.firstName, @"\"%s\" is expecting the property 'firstName' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.middleName, @"\"%s\" is expecting the property 'middleName' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.lastName, @"\"%s\" is expecting the property 'lastName' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.suffix, @"\"%s\" is expecting the property 'suffix' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.fullName, @"\"%s\" is expecting the property 'fullName' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.lastModified, @"\"%s\" is expecting the property 'lastModified' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.urls, @"\"%s\" is expecting the property 'urls' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.thumbnail, @"\"%s\" is expecting the property 'thumbnail' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.comics, @"\"%s\" is expecting the property 'comics' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.stories, @"\"%s\" is expecting the property 'stories' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.series, @"\"%s\" is expecting the property 'events' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.events, @"\"%s\" is expecting the property 'events' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithPartialDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyIdentifier: @1234,
								 RCResponseKeyMiddleName: @"TestMiddleName",
								 RCResponseKeySuffix: @"TestSuffix",
								 RCResponseKeyModified: @"2013-11-20T17:40:18-0500",
								 RCResponseKeyURLs: @[@{RCResponseKeyType: @"TestType",
														RCResponseKeyURL: @"http://testurl.com"},
													  @{RCResponseKeyType: @"TestAnotherType",
														RCResponseKeyURL: @"http://testanotherurl.com"}],
								 RCResponseKeyComics: @{RCResponseKeyAvailable: @0,
														RCResponseKeyReturned: @0,
														RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
														RCResponseKeyItems: @[]},
								 RCResponseKeySeries: @{RCResponseKeyAvailable: @0,
														RCResponseKeyReturned: @0,
														RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
														RCResponseKeyItems: @[]}};

	RCCreatorObject *creator = [[RCCreatorObject alloc] initWithDictionary:dictionary];

	XCTAssertNotNil(creator.identifier, @"\"%s\" is expecting the property 'identifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.firstName, @"\"%s\" is expecting the property 'firstName' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.middleName, @"\"%s\" is expecting the property 'middleName' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.lastName, @"\"%s\" is expecting the property 'lastName' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.suffix, @"\"%s\" is expecting the property 'suffix' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.fullName, @"\"%s\" is expecting the property 'fullName' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.lastModified, @"\"%s\" is expecting the property 'lastModified' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.urls, @"\"%s\" is expecting the property 'urls' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.thumbnail, @"\"%s\" is expecting the property 'thumbnail' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.comics, @"\"%s\" is expecting the property 'comics' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.stories, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(creator.series, @"\"%s\" is expecting the property 'events' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(creator.events, @"\"%s\" is expecting the property 'events' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithNil
{
	RCCreatorObject *creator = [[RCCreatorObject alloc] initWithDictionary:nil];

	XCTAssertNil(creator, @"\"%s\" is expecting the property 'creator' to be NULL.", __PRETTY_FUNCTION__);
}

@end
