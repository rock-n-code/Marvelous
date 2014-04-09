//
//  RCCharacterFilterTests.m
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

#import "RCCharacterFilter.h"

@interface RCCharacterFilterTests : XCTestCase

@end

@implementation RCCharacterFilterTests

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
    RCCharacterFilter *filter = [[RCCharacterFilter alloc] init];

	XCTAssertNil(filter.name, @"\"%s\" is expecting the property 'name' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.nameStartsWith, @"\"%s\" is expecting the property 'nameStartsWith' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.modifiedSince, @"\"%s\" is expecting the property 'modifiedSince' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.comics, @"\"%s\" is expecting the property 'comics' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.series, @"\"%s\" is expecting the property 'series' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.events, @"\"%s\" is expecting the property 'events' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.stories, @"\"%s\" is expecting the property 'stories' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.limit, @"\"%s\" is expecting the property 'limit' to be NULL.", __PRETTY_FUNCTION__);
    XCTAssertNil(filter.offset, @"\"%s\" is expecting the property 'offset' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(filter.orderBy, @"\"%s\" is expecting the property 'orderBy' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(filter.validOrderTypes, @"\"%s\" is expecting the property 'validOrderTypes' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testParameters
{
	RCCharacterFilter *filter = [[RCCharacterFilter alloc] init];

	filter.name = @"TestName";
	filter.nameStartsWith = @"TestNameStartsWith";
	filter.modifiedSince = [NSDate date];
	filter.comics = @[@0, @1, @2];
	filter.series = @[@"0", @"1", @"2"];
	filter.events = @[@0, @1, @2];
	filter.stories = @[@"0", @"1", @"2"];
	filter.offset = @0;
	filter.limit = @0;
	filter.orderBy = @[@(RCOrderByTypeCodeNameAscending), @(RCOrderByTypeCodeDateModifiedAscending)];

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 10;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testPartialParameters
{
	RCCharacterFilter *filter = [[RCCharacterFilter alloc] init];

	filter.name = @"TestName";
	filter.limit = @0;
	filter.series = @[@"0", @"1", @"2"];
	filter.orderBy = @[@(RCOrderByTypeCodeNameDescending)];

	NSDictionary *parameters = filter.parameters;
	NSInteger countToTest = 4;

	XCTAssertNotNil(parameters, @"\"%s\" is expecting the variable 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqual(parameters.allKeys.count, countToTest, @"\"%s\" is expecting the property 'count' of the variable 'parameters' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testValidOrderTypes
{
	RCCharacterFilter *filter = [[RCCharacterFilter alloc] init];
	NSInteger countToTest = 4;

	XCTAssertEqual(filter.validOrderTypes.count, countToTest, @"\"%s\" is expecting the property 'count' of the property 'validOrderTypes' to be the integer value %ld.", __PRETTY_FUNCTION__, (long)countToTest);
}

- (void)testType
{
	RCCharacterFilter *filter = [[RCCharacterFilter alloc] init];

	XCTAssertEqual(filter.type, RCAPITypeCharacters, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeCharacters);
}

@end
