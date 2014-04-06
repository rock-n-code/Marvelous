//
//  RCCreatorObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCCreatorObject.h"

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

@end
