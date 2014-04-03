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

- (void)testCharacterByIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharacterByInvalidIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharacterByNilIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersWithEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersWithInvalidEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersWithNilEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByFilterEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByBadFilterEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByNilFilterEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByFilterInvalidEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByFilterNilEventIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByInvalidIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsWithCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsWithInvalidCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsWithNilCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByFilterCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByBadFilterCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilFilterCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByFilterInvalidCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByFilterNilCharacterIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

@end
