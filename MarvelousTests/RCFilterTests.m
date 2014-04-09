//
//  RCFilterTests.m
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

#import "RCFilter.h"

@interface RCFilterTests : XCTestCase

@end

@implementation RCFilterTests

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
	RCFilter *filter = [[RCFilter alloc] init];

	XCTAssertNil(filter.modifiedSince, @"\"%s\" is expecting the property 'modifiedSince' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
    XCTAssertNil(filter.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.orderBy, @"\"%s\" is expecting the property 'orderBy' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.validOrderTypes, @"\"%s\" is expecting the property 'validOrderTypes' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testValidOrderTypes
{
	RCFilter *filter = [[RCFilter alloc] init];

	XCTAssertNil(filter.validOrderTypes, @"\"%s\" is expecting the property 'validOrderTypes' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testType
{
	RCFilter *filter = [[RCFilter alloc] init];

	XCTAssertEqual(filter.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeUndefined);
}

@end
