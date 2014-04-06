//
//  RCComicsObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
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

@end
