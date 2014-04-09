//
//  RCComicsObjectTests.m
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

#import "RCComicsObject.h"

@interface RCComicsObjectTests : XCTestCase

@end

@implementation RCComicsObjectTests

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
	RCComicsObject *comics = [[RCComicsObject alloc] init];

	XCTAssertNil(comics.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.digitalIdentifier, @"\"%s\" is expecting the property 'digitalIdentifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.title, @"\"%s\" is expecting the property 'title' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.issueNumber, @"\"%s\" is expecting the property 'issueNumber' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.summary, @"\"%s\" is expecting the property 'summary' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.variantDescription, @"\"%s\" is expecting the property 'variantDescription' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.lastModified, @"\"%s\" is expecting the property 'lastModified' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.isbn, @"\"%s\" is expecting the property 'isbn' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.upc, @"\"%s\" is expecting the property 'upc' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.diamondCode, @"\"%s\" is expecting the property 'diamondCode' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.ean, @"\"%s\" is expecting the property 'ean' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.issn, @"\"%s\" is expecting the property 'issn' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.format, @"\"%s\" is expecting the property 'format' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.pageCount, @"\"%s\" is expecting the property 'pageCount' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.textObjects, @"\"%s\" is expecting the property 'textObjects' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.urls, @"\"%s\" is expecting the property 'urls' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.series, @"\"%s\" is expecting the property 'series' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.variants, @"\"%s\" is expecting the property 'variants' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.collections, @"\"%s\" is expecting the property 'collections' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.collectedIssues, @"\"%s\" is expecting the property 'collectedIssues' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.dates, @"\"%s\" is expecting the property 'dates' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.prices, @"\"%s\" is expecting the property 'prices' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.thumbnail, @"\"%s\" is expecting the property 'thumbnail' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.images, @"\"%s\" is expecting the property 'images' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.creators, @"\"%s\" is expecting the property 'creators' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.characters, @"\"%s\" is expecting the property 'characters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.stories, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comics.events, @"\"%s\" is expecting the property 'events' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyIdentifier: @1234,
								 RCResponseKeyDigitalIdentifier: @1234,
								 RCResponseKeyTitle: @"TestTitle",
								 RCResponseKeyIssueNumber: @0.5,
								 RCResponseKeyDescription: @"TestDescription",
								 RCResponseKeyVariantDescription: @"TestVariantDescription",
								 RCResponseKeyModified: @"2013-11-20T17:40:18-0500",
								 RCResponseKeyISBN: @"TestISBN",
								 RCResponseKeyUPC: @"TestUPC",
								 RCResponseKeyDiamondCode: @"TestDiamondCode",
								 RCResponseKeyEAN: @"TestEAN",
								 RCResponseKeyISSN: @"TestISSN",
								 RCResponseKeyFormat: @"TestFormat",
								 RCResponseKeyPageCount: @32,
								 RCResponseKeyTextObjects: @[@{RCResponseKeyType: @"TestType",
															   RCResponseKeyLanguage: @"TestLanguage",
															   RCResponseKeyText: @"TestText"},
															 @{RCResponseKeyType: @"TestAnotherType",
															   RCResponseKeyLanguage: @"TestAnotherLanguage",
															   RCResponseKeyText: @"TestAnotherText"}],
								 RCResponseKeyResourceURI: @"http://testcollectionuri.com",
								 RCResponseKeyURLs: @[@{RCResponseKeyType: @"TestType",
														RCResponseKeyURL: @"http://testurl.com"},
													  @{RCResponseKeyType: @"TestAnotherType",
														RCResponseKeyURL: @"http://testanotherurl.com"}],
								 RCResponseKeySeries: @{RCResponseKeyResourceURI: @"TestResourceURI",
														RCResponseKeyName: @"TestName"},
								 RCResponseKeyVariants: @[@{RCResponseKeyResourceURI: @"TestResourceURI",
															RCResponseKeyName: @"TestName"},
														  @{RCResponseKeyResourceURI: @"TestResourceURI",
															RCResponseKeyName: @"TestName"}],
								 RCResponseKeyCollections: @[@{RCResponseKeyResourceURI: @"TestResourceURI",
															   RCResponseKeyName: @"TestName"},
															 @{RCResponseKeyResourceURI: @"TestResourceURI",
															   RCResponseKeyName: @"TestName"}],
								 RCResponseKeyCollectedIssues: @[@{RCResponseKeyResourceURI: @"TestResourceURI",
																   RCResponseKeyName: @"TestName"},
																 @{RCResponseKeyResourceURI: @"TestResourceURI",
																   RCResponseKeyName: @"TestName"}],
								 RCResponseKeyDates: @[@{RCResponseKeyType: @"TestType",
														 RCResponseKeyDate: @"2013-11-20T17:40:18-0500"},
													   @{RCResponseKeyType: @"TestAnotherType",
														 RCResponseKeyDate: @"2013-11-20T17:40:18-0500"}],
								 RCResponseKeyPrices: @[@{RCResponseKeyType: @"TestType",
														  RCResponseKeyPrice: @12.34},
														@{RCResponseKeyType: @"TestAnotherType",
														  RCResponseKeyPrice: @12.34}],
								 RCResponseKeyThumbnail: @{RCResponseKeyPath: @"http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73",
														   RCResponseKeyExtension: @"jpg"},
								 RCResponseKeyImages: @[@{RCResponseKeyPath: @"http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73",
														  RCResponseKeyExtension: @"jpg"},
														@{RCResponseKeyPath: @"http://i.annihil.us/u/prod/marvel/i/mg 3/40/4bb4680432f73",
														  RCResponseKeyExtension: @"jpg"}],
								 RCResponseKeyCreators: @{RCResponseKeyAvailable: @0,
														  RCResponseKeyReturned: @0,
														  RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
														  RCResponseKeyItems: @[]},
								 RCResponseKeyCharacters: @{RCResponseKeyAvailable: @0,
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
														RCResponseKeyItems: @[]}};

	RCComicsObject *comics = [[RCComicsObject alloc] initWithDictionary:dictionary];

	XCTAssertNotNil(comics.identifier, @"\"%s\" is expecting the property 'identifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.digitalIdentifier, @"\"%s\" is expecting the property 'digitalIdentifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.title, @"\"%s\" is expecting the property 'title' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.issueNumber, @"\"%s\" is expecting the property 'issueNumber' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.summary, @"\"%s\" is expecting the property 'summary' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.variantDescription, @"\"%s\" is expecting the property 'variantDescription' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.lastModified, @"\"%s\" is expecting the property 'lastModified' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.isbn, @"\"%s\" is expecting the property 'isbn' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.upc, @"\"%s\" is expecting the property 'upc' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.diamondCode, @"\"%s\" is expecting the property 'diamondCode' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.ean, @"\"%s\" is expecting the property 'ean' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.issn, @"\"%s\" is expecting the property 'issn' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.format, @"\"%s\" is expecting the property 'format' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.pageCount, @"\"%s\" is expecting the property 'pageCount' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.textObjects, @"\"%s\" is expecting the property 'textObjects' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.resourceURI, @"\"%s\" is expecting the property 'resourceURI' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.urls, @"\"%s\" is expecting the property 'urls' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.series, @"\"%s\" is expecting the property 'series' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.variants, @"\"%s\" is expecting the property 'variants' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.collections, @"\"%s\" is expecting the property 'collections' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.collectedIssues, @"\"%s\" is expecting the property 'collectedIssues' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.dates, @"\"%s\" is expecting the property 'dates' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.prices, @"\"%s\" is expecting the property 'prices' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.thumbnail, @"\"%s\" is expecting the property 'thumbnail' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.images, @"\"%s\" is expecting the property 'images' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.creators, @"\"%s\" is expecting the property 'creators' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.characters, @"\"%s\" is expecting the property 'characters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.stories, @"\"%s\" is expecting the property 'stories' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(comics.events, @"\"%s\" is expecting the property 'events' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
