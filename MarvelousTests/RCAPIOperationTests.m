//
//  RCAPIOperationTests.m
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

#import "RCAPIOperation.h"
#import "RCCharacterFilter.h"
#import "RCComicsFilter.h"
#import "RCCreatorFilter.h"
#import "RCEventFilter.h"
#import "RCSeriesFilter.h"
#import "RCStoryFilter.h"
#import "RCMarvelAPITestValues.h"

@interface RCAPIOperationTests : XCTestCase

@end

@implementation RCAPIOperationTests

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
	RCAPIOperation *operation = [[RCAPIOperation alloc] init];

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithCharacterFilterAndAuthentication
{
	RCCharacterFilter *filter = [[RCCharacterFilter alloc] init];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeCharacters, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeCharacters);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithComicsFilterAndAuthentication
{
	RCComicsFilter *filter = [[RCComicsFilter alloc] init];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeComics, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeComics);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithCreatorFilterAndAuthentication
{
	RCCreatorFilter *filter = [[RCCreatorFilter alloc] init];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeCreators, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeCreators);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithEventFilterAndAuthentication
{
	RCEventFilter *filter = [[RCEventFilter alloc] init];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeEvents, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeEvents);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithSeriesFilterAndAuthentication
{
	RCSeriesFilter *filter = [[RCSeriesFilter alloc] init];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeSeries, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeSeries);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithStoryFilterAndAuthentication
{
	RCStoryFilter *filter = [[RCStoryFilter alloc] init];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithFilter:filter andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeStories, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeStories);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeIdentifierAndAuthentication
{
	NSString *identifier = [NSString stringWithFormat:@"%ld", (long)RCMarvelAPITestValueValidIdentifier];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:identifier andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeCharacters, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeCharacters);
	XCTAssertNotNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithUndefinedTypeIdentifierAndAuthentication
{
	NSString *identifier = [NSString stringWithFormat:@"%ld", (long)RCMarvelAPITestValueValidIdentifier];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeUndefined identifier:identifier andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeNilIdentifierAndAuthentication
{
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:nil andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeIdentifierFilterAndAuthentication
{
	NSString *identifier = [NSString stringWithFormat:@"%ld", (long)RCMarvelAPITestValueValidIdentifier];
	RCEventFilter *filter = [[RCEventFilter alloc] init];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:identifier filter:filter andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeCharacters, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeCharacters);
	XCTAssertNotNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithUndefinedTypeIdentifierFilterAndAuthentication
{
	NSString *identifier = [NSString stringWithFormat:@"%ld", (long)RCMarvelAPITestValueValidIdentifier];
	RCEventFilter *filter = [[RCEventFilter alloc] init];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeUndefined identifier:identifier filter:filter andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeNilIdentifierFilterAndAuthentication
{
	RCEventFilter *filter = [[RCEventFilter alloc] init];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:nil filter:filter andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeIdentifierNilFilterAndAuthentication
{
	NSString *identifier = [NSString stringWithFormat:@"%ld", (long)RCMarvelAPITestValueValidIdentifier];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:identifier filter:nil andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%ld' integer value.", __PRETTY_FUNCTION__, (long)RCAPITypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

@end
