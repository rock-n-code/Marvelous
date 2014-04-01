//
//  RCDataContainerObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCDataContainerObject.h"
#import "RCResponseKeys.h"

@interface RCDataContainerObjectTests : XCTestCase

@end

@implementation RCDataContainerObjectTests

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
	RCDataContainerObject *container = [[RCDataContainerObject alloc] init];

	XCTAssertNil(container.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(container.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(container.total, @"\"%s\" is expecting the property 'copyright' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(container.count, @"\"%s\" is expecting the property 'count' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(container.results, @"\"%s\" is expecting the property 'results' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithCharacterTypeAndDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyOffset: @0,
								 RCResponseKeyLimit: @0,
								 RCResponseKeyTotal: @0,
								 RCResponseKeyCount: @0,
								 RCResponseKeyResults: @[@{RCResponseKeyIdentifier: @1234,
														   RCResponseKeyName: @"TestName",
														   RCResponseKeyDescription: @"TestDescription",
														   RCResponseKeyModified: @"2013-11-20T17:40:18-0500",
														   RCResponseKeyResourceURI: @"http://testcollectionuri.com",
														   RCResponseKeyURLs: @[],
														   RCResponseKeyThumbnail: @{RCResponseKeyPath: @"http://testurl",
																					 RCResponseKeyExtension: @"com"},
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
														   RCResponseKeySeries: @{RCResponseKeyAvailable: @0,
																				  RCResponseKeyReturned: @0,
																				  RCResponseKeyCollectionURI: @"http://testcollectionuri.com",
																				  RCResponseKeyItems: @[]}}]};
	
	RCDataContainerObject *container = [[RCDataContainerObject alloc] initWithType:RCAPITypeCharacters andDictionary:dictionary];

	XCTAssertNotNil(container.offset, @"\"%s\" is expecting the property 'offset' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(container.limit, @"\"%s\" is expecting the property 'limit' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(container.total, @"\"%s\" is expecting the property 'copyright' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(container.count, @"\"%s\" is expecting the property 'count' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(container.results, @"\"%s\" is expecting the property 'results' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
