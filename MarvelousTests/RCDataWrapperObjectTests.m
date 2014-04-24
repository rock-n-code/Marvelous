//
//  RCDataWrapperObjectTests.m
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

#import "RCDataWrapperObject.h"
#import "RCResponseKeys.h"

@interface RCDataWrapperObjectTests : XCTestCase

@end

@implementation RCDataWrapperObjectTests

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
	RCDataWrapperObject *wrapper = [[RCDataWrapperObject alloc] init];

	XCTAssertNil(wrapper.code, @"\"%s\" is expecting the property 'code' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.status, @"\"%s\" is expecting the property 'status' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.copyright, @"\"%s\" is expecting the property 'copyright' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.attributionText, @"\"%s\" is expecting the property 'attributionText' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.attributionHTML, @"\"%s\" is expecting the property 'attributionHTML' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.data, @"\"%s\" is expecting the property 'data' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.etag, @"\"%s\" is expecting the property 'etag' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeAndDictionary
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
	
	RCDataWrapperObject *wrapper = [[RCDataWrapperObject alloc] initWithType:RCAPITypeCharacters andDictionary:dictionary];

	XCTAssertNotNil(wrapper.code, @"\"%s\" is expecting the property 'code' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.status, @"\"%s\" is expecting the property 'status' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.copyright, @"\"%s\" is expecting the property 'copyright' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.attributionText, @"\"%s\" is expecting the property 'attributionText' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.attributionHTML, @"\"%s\" is expecting the property 'attributionHTML' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.data, @"\"%s\" is expecting the property 'data' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.etag, @"\"%s\" is expecting the property 'etag' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeAndPartialDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyCode: @0,
								 RCResponseKeyCopyright: @"TestCopyright",
								 RCResponseKeyAttributionHTML: @"TestAttributionHTML",
								 RCResponseKeyETag: @"TestEtag"};

	RCDataWrapperObject *wrapper = [[RCDataWrapperObject alloc] initWithType:RCAPITypeCharacters andDictionary:dictionary];

	XCTAssertNotNil(wrapper.code, @"\"%s\" is expecting the property 'code' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.status, @"\"%s\" is expecting the property 'status' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.copyright, @"\"%s\" is expecting the property 'copyright' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.attributionText, @"\"%s\" is expecting the property 'attributionText' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.attributionHTML, @"\"%s\" is expecting the property 'attributionHTML' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(wrapper.data, @"\"%s\" is expecting the property 'data' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(wrapper.etag, @"\"%s\" is expecting the property 'etag' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeAndNil
{
	RCDataWrapperObject *wrapper = [[RCDataWrapperObject alloc] initWithType:RCAPITypeCharacters andDictionary:nil];

	XCTAssertNil(wrapper, @"\"%s\" is expecting the property 'wrapper' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithUndefinedTypeAndDictionary
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

	RCDataWrapperObject *wrapper = [[RCDataWrapperObject alloc] initWithType:RCAPITypeUndefined andDictionary:dictionary];

	XCTAssertNil(wrapper, @"\"%s\" is expecting the property 'wrapper' to be NULL.", __PRETTY_FUNCTION__);
}

@end
