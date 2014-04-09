//
//  RCDataContainerObjectTests.m
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
