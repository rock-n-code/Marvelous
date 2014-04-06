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

- (void)testCharactersByEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByInvalidEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByNilEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByEventIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByEventIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByInvalidStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByNilStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByStoryIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByStoryIdentifierNilFilterAndCompletionBlock
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

- (void)testEventsByCharacterIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByInvalidCharacterIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilCharacterIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByCharacterIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByCharacterIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByInvalidStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByStoryIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByStoryIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

@end
