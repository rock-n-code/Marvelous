//
//  RCQueryInfoObjectTests.m
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

#import "RCQueryInfoObject.h"
#import "RCDataWrapperObject.h"
#import "RCResponseKeys.h"

@interface RCQueryInfoObjectTests : XCTestCase

@end

@implementation RCQueryInfoObjectTests

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
	RCQueryInfoObject *info = [[RCQueryInfoObject alloc] init];

	XCTAssertNil(info.copyright, @"\"%s\" is expecting the property 'copyright' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.attributionText, @"\"%s\" is expecting the property 'attributionText' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.attributionHTML, @"\"%s\" is expecting the property 'attributionHTML' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.etag, @"\"%s\" is expecting the property 'etag' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.total, @"\"%s\" is expecting the property 'total' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(info.count, @"\"%s\" is expecting the property 'count' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithDataWrapper
{
	NSDictionary *dictionary = @{RCResponseKeyCode: @0,
								 RCResponseKeyStatus: @"TestStatus",
								 RCResponseKeyCopyright: @"TestCopyright",
								 RCResponseKeyAttributionText: @"TestAttributionText",
								 RCResponseKeyAttributionHTML: @"TestAttributionHTML",
								 RCResponseKeyData: @{RCResponseKeyOffset: @0,
													  RCResponseKeyLimit: @0,
													  RCResponseKeyTotal: @0,
													  RCResponseKeyCount: @0,
													  RCResponseKeyResults: @[]},
								 RCResponseKeyETag: @"TestEtag"};

	RCDataWrapperObject *dataWrapper = [[RCDataWrapperObject alloc] initWithType:RCAPITypeCharacters andDictionary:dictionary];
	RCQueryInfoObject *info = [[RCQueryInfoObject alloc] initWithDataWrapper:dataWrapper];

	XCTAssertNotNil(info.copyright, @"\"%s\" is expecting the property 'copyright' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.attributionText, @"\"%s\" is expecting the property 'attributionText' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.attributionHTML, @"\"%s\" is expecting the property 'attributionHTML' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.etag, @"\"%s\" is expecting the property 'etag' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.offset, @"\"%s\" is expecting the property 'offset' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.limit, @"\"%s\" is expecting the property 'limit' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.total, @"\"%s\" is expecting the property 'total' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(info.count, @"\"%s\" is expecting the property 'count' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithNil
{
	RCQueryInfoObject *info = [[RCQueryInfoObject alloc] initWithDataWrapper:nil];

	XCTAssertNil(info, @"\"%s\" is expecting the property 'info' to be NULL.", __PRETTY_FUNCTION__);
}

@end
