//
//  RCAPIOperationTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCAPIOperation.h"
#import "RCCharacterFilter.h"
#import "RCCreatorFilter.h"
#import "RCEventFilter.h"
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

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeUndefined);
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

	XCTAssertEqual(operation.type, RCAPITypeCharacters, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeCharacters);
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

	XCTAssertEqual(operation.type, RCAPITypeCreators, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeCreators);
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

	XCTAssertEqual(operation.type, RCAPITypeEvents, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeEvents);
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

	XCTAssertEqual(operation.type, RCAPITypeStories, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeStories);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeIdentifierAndAuthentication
{
	NSString *identifier = [NSString stringWithFormat:@"%d", RCMarvelAPITestValueValidIdentifier];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:identifier andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeCharacters, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeCharacters);
	XCTAssertNotNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithUndefinedTypeIdentifierAndAuthentication
{
	NSString *identifier = [NSString stringWithFormat:@"%d", RCMarvelAPITestValueValidIdentifier];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeUndefined identifier:identifier andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeUndefined);
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

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeIdentifierFilterAndAuthentication
{
	NSString *identifier = [NSString stringWithFormat:@"%d", RCMarvelAPITestValueValidIdentifier];
	RCEventFilter *filter = [[RCEventFilter alloc] init];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:identifier filter:filter andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeCharacters, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeCharacters);
	XCTAssertNotNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.url, @"\"%s\" is expecting the property 'url' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithUndefinedTypeIdentifierFilterAndAuthentication
{
	NSString *identifier = [NSString stringWithFormat:@"%d", RCMarvelAPITestValueValidIdentifier];
	RCEventFilter *filter = [[RCEventFilter alloc] init];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeUndefined identifier:identifier filter:filter andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeUndefined);
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

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeIdentifierNilFilterAndAuthentication
{
	NSString *identifier = [NSString stringWithFormat:@"%d", RCMarvelAPITestValueValidIdentifier];
	NSDictionary *authentication = @{};
	RCAPIOperation *operation = [[RCAPIOperation alloc] initWithType:RCAPITypeCharacters identifier:identifier filter:nil andAuthentication:authentication];

	XCTAssertEqual(operation.type, RCAPITypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPITypeUndefined);
	XCTAssertNil(operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.parameters, @"\"%s\" is expecting the property 'parameters' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(operation.data, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

@end
