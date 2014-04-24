//
//  RCObjectTests.m
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

#import "RCObject.h"

@interface RCObjectTests : XCTestCase

@end

@implementation RCObjectTests

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
	RCObject *object = [[RCObject alloc] init];

	XCTAssertNotNil(object, @"\"%s\" is expecting the 'object' instance to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithDictionary
{
	RCObject *object = [[RCObject alloc] initWithDictionary:@{}];

	XCTAssertNotNil(object, @"\"%s\" is expecting the 'object' instance to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithNil
{
	RCObject *object = [[RCObject alloc] initWithDictionary:nil];

	XCTAssertNil(object, @"\"%s\" is expecting the 'object' instance to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testDateFromStringWithSupportedFormat
{
	RCObject *object = [[RCObject alloc] init];
	NSDate *date = [object dateFromString:@"2014-04-23T23:32:00+0100"];

	XCTAssertNotNil(date, @"\"%s\" is expecting the 'date' instance to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testDateFromStringWithOtherSupportedFormat
{
	RCObject *object = [[RCObject alloc] init];
	NSDate *date = [object dateFromString:@"2014-04-23 23:32:00"];

	XCTAssertNotNil(date, @"\"%s\" is expecting the 'date' instance to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testDateFromStringWithNotSupportedFormat
{
	RCObject *object = [[RCObject alloc] init];
	NSDate *date = [object dateFromString:@"04/23/2014"];

	XCTAssertNil(date, @"\"%s\" is expecting the 'date' instance to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testDateFromStringWithNil
{
	RCObject *object = [[RCObject alloc] init];
	NSDate *date = [object dateFromString:nil];

	XCTAssertNil(date, @"\"%s\" is expecting the 'date' instance to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testUrlsFromArrayWithArray
{
	RCObject *object = [[RCObject alloc] init];
	NSArray *array = [object urlsFromArray:@[]];

	XCTAssertNotNil(array, @"\"%s\" is expecting the 'array' instance to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testUrlsFromArrayWithNil
{
	RCObject *object = [[RCObject alloc] init];
	NSArray *array = [object urlsFromArray:nil];

	XCTAssertNil(array, @"\"%s\" is expecting the 'array' instance to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testIsValidObjectWithDictionary
{
	RCObject *object = [[RCObject alloc] init];
	BOOL result = [object isValidObject:@{}];

	XCTAssertTrue(result, @"\"%s\" is expecting the 'result' value to be YES.", __PRETTY_FUNCTION__);
}

- (void)testIsValidObjectWithArray
{
	RCObject *object = [[RCObject alloc] init];
	BOOL result = [object isValidObject:@[]];

	XCTAssertTrue(result, @"\"%s\" is expecting the 'result' value to be YES.", __PRETTY_FUNCTION__);
}

- (void)testIsValidObjectWithString
{
	RCObject *object = [[RCObject alloc] init];
	BOOL result = [object isValidObject:@""];

	XCTAssertTrue(result, @"\"%s\" is expecting the 'result' value to be YES.", __PRETTY_FUNCTION__);
}

- (void)testIsValidObjectWithNumber
{
	RCObject *object = [[RCObject alloc] init];
	BOOL result = [object isValidObject:@0];

	XCTAssertTrue(result, @"\"%s\" is expecting the 'result' value to be YES.", __PRETTY_FUNCTION__);
}

- (void)testIsValidObjectWithObject
{
	RCObject *object = [[RCObject alloc] init];
	BOOL result = [object isValidObject:object];

	XCTAssertTrue(result, @"\"%s\" is expecting the 'result' value to be YES.", __PRETTY_FUNCTION__);
}

- (void)testIsValidObjectWithNil
{
	RCObject *object = [[RCObject alloc] init];
	BOOL result = [object isValidObject:nil];

	XCTAssertFalse(result, @"\"%s\" is expecting the 'result' value to be NO.", __PRETTY_FUNCTION__);
}

- (void)testIsValidObjectWithNULL
{
	RCObject *object = [[RCObject alloc] init];
	BOOL result = [object isValidObject:[NSNull null]];

	XCTAssertFalse(result, @"\"%s\" is expecting the 'result' value to be NO.", __PRETTY_FUNCTION__);
}

@end
