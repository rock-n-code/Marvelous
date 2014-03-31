//
//  RCMarvelAPITests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

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
	self.api.publicKey = RCMarvelAPITestValuePublicKey;

	XCTAssertEqualObjects(self.api.publicKey, RCMarvelAPITestValuePublicKey, @"\"%s\" is expecting the property 'publicKey' to have the '%@' string value.", __PRETTY_FUNCTION__, RCMarvelAPITestValuePublicKey);
}

- (void)testPrivateKeyWithNil
{
	self.api.privateKey = nil;

	XCTAssertNil(self.api.privateKey, @"\"%s\" is expecting the property 'privateKey' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testPrivateKeyWithString
{
	self.api.privateKey = RCMarvelAPITestValuePrivateKey;

	XCTAssertEqualObjects(self.api.privateKey, RCMarvelAPITestValuePrivateKey, @"\"%s\" is expecting the property 'publicKey' to have the '%@' string value.", __PRETTY_FUNCTION__, RCMarvelAPITestValuePrivateKey);
}

- (void)testVersion
{
	XCTAssertEqualObjects(self.api.version, RCMarvelAPITestValueVersion, @"\"%s\" is expecting the property 'version' to have the '%@' string value.", __PRETTY_FUNCTION__, RCMarvelAPITestValueVersion);
}

@end
