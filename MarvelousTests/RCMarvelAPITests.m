//
//  RCMarvelAPITests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "XCTest+Async.h"
#import "RCMarvelAPI.h"
#import "RCMarvelAPITestValues.h"

@interface RCMarvelAPITests : XCTestCase

@property (nonatomic, strong) RCMarvelAPI *api;

@end

@implementation RCMarvelAPITests

- (void)setUp
{
    [super setUp];

	self.api = [RCMarvelAPI api];
}

- (void)tearDown
{
    self.api = nil;

	[super tearDown];
}

- (void)testInit
{
	RCMarvelAPI *api = [[RCMarvelAPI alloc] init];

	XCTAssertNil(api.publicKey, @"\"%s\" is expecting the property 'publicKey' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(api.privateKey, @"\"%s\" is expecting the property 'privateKey' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertEqualObjects(api.version, RCMarvelAPITestValueVersion, @"\"%s\" is expecting the property 'version' to have the '%@' string value.", __PRETTY_FUNCTION__, RCMarvelAPITestValueVersion);
}

- (void)testVersion
{
	XCTAssertEqualObjects(self.api.version, RCMarvelAPITestValueVersion, @"\"%s\" is expecting the property 'version' to have the '%@' string value.", __PRETTY_FUNCTION__, RCMarvelAPITestValueVersion);
}

- (void)testGetWithInvalidPublicKey
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetWithInvalidPrivateKey
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetWithInvalidCredentials
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharacterByIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharacterByInvalidIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharacterByNilIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharactersByFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharactersByBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharactersByNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharactersWithEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharactersWithInvalidEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharactersWithNilEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharactersByFilterEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharactersByBadFilterEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharactersByNilFilterEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharactersByFilterInvalidEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetCharactersByFilterNilEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsByIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsByInvalidIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsByFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsByBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsByNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsWithCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsWithInvalidCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsWithNilCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsByFilterCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsByBadFilterCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsByNilFilterCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsByFilterInvalidCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testGetEventsByFilterNilCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

@end
