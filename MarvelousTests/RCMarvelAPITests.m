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

- (void)testPublicKeyWithNil
{
	self.api.publicKey = nil;

	XCTAssertNil(self.api.publicKey, @"\"%s\" is expecting the property 'publicKey' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testPublicKeyWithString
{
	self.api.publicKey = RCMarvelAPITestValueValidPublicKey;

	XCTAssertEqualObjects(self.api.publicKey, RCMarvelAPITestValueValidPublicKey, @"\"%s\" is expecting the property 'publicKey' to have the '%@' string value.", __PRETTY_FUNCTION__, RCMarvelAPITestValueValidPublicKey);
}

- (void)testPrivateKeyWithNil
{
	self.api.privateKey = nil;

	XCTAssertNil(self.api.privateKey, @"\"%s\" is expecting the property 'privateKey' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testPrivateKeyWithString
{
	self.api.privateKey = RCMarvelAPITestValueValidPrivateKey;

	XCTAssertEqualObjects(self.api.privateKey, RCMarvelAPITestValueValidPrivateKey, @"\"%s\" is expecting the property 'publicKey' to have the '%@' string value.", __PRETTY_FUNCTION__, RCMarvelAPITestValueValidPrivateKey);
}

- (void)testVersion
{
	XCTAssertEqualObjects(self.api.version, RCMarvelAPITestValueVersion, @"\"%s\" is expecting the property 'version' to have the '%@' string value.", __PRETTY_FUNCTION__, RCMarvelAPITestValueVersion);
}

- (void)testGetCharacterWithIdentifierAndCompletionBlock
{
	[self runAsynchronousBlock:^(stopExecution stop) {
		self.api.publicKey = RCMarvelAPITestValueValidPublicKey;
		self.api.privateKey = RCMarvelAPITestValueValidPrivateKey;
		
		[self.api getCharacterByIdentifier:@(RCMarvelAPITestValidValidIdentifier) andCompletionBlock:^(RCCharacterObject *character, RCQueryInfoObject *info, NSError *error) {
			XCTAssertNotNil(character, @"\"%s\" is expecting the value 'character' to be not NULL.", __PRETTY_FUNCTION__);
			XCTAssertNotNil(info, @"\"%s\" is expecting the value 'info' to be not NULL.", __PRETTY_FUNCTION__);
			XCTAssertNil(error, @"\"%s\" is expecting the value 'error' to be NULL.", __PRETTY_FUNCTION__);

			stop();
		}];
	}];
}

- (void)testGetCharacterWithInvalidIdentifierAndCompletionBlock
{
	[self runAsynchronousBlock:^(stopExecution stop) {
		self.api.publicKey = RCMarvelAPITestValueValidPublicKey;
		self.api.privateKey = RCMarvelAPITestValueValidPrivateKey;

		[self.api getCharacterByIdentifier:@(RCMarvelAPITestValidInvalidIdentifier) andCompletionBlock:^(RCCharacterObject *character, RCQueryInfoObject *info, NSError *error) {
			XCTAssertNil(character, @"\"%s\" is expecting the value 'character' to be NULL.", __PRETTY_FUNCTION__);
			XCTAssertNil(info, @"\"%s\" is expecting the value 'info' to be NULL.", __PRETTY_FUNCTION__);
			XCTAssertNotNil(error, @"\"%s\" is expecting the value 'error' to be not NULL.", __PRETTY_FUNCTION__);

			stop();
		}];
	}];
}

- (void)testGetCharacterWithIdentifierInvalidCredentialsAndCompletionBlock
{
	[self runAsynchronousBlock:^(stopExecution stop) {
		self.api.publicKey = RCMarvelAPITestValueInvalidPublicKey;
		self.api.privateKey = RCMarvelAPITestValueInvalidPrivateKey;

		[self.api getCharacterByIdentifier:@(RCMarvelAPITestValidValidIdentifier) andCompletionBlock:^(RCCharacterObject *character, RCQueryInfoObject *info, NSError *error) {
			XCTAssertNil(character, @"\"%s\" is expecting the value 'character' to be NULL.", __PRETTY_FUNCTION__);
			XCTAssertNil(info, @"\"%s\" is expecting the value 'info' to be NULL.", __PRETTY_FUNCTION__);
			XCTAssertNotNil(error, @"\"%s\" is expecting the value 'error' to be not NULL.", __PRETTY_FUNCTION__);

			stop();
		}];
	}];
}

@end
