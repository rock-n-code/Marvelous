//
//  RCMarvelAPITests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCMarvelAPI.h"

static NSString * const RCMarvelAPITestPublicKey = @"This is a test public key.";

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
}

- (void)testPublicKeyWithNil
{
	self.api.publicKey = nil;

	XCTAssertNil(self.api.publicKey, @"\"%s\" is expecting the property 'publicKey' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testPublicKeyWithString
{
	self.api.publicKey = RCMarvelAPITestPublicKey;

	XCTAssertEqualObjects(self.api.publicKey, RCMarvelAPITestPublicKey, @"\"%s\" is expecting the property 'publicKey' to have the '%@' string value.", __PRETTY_FUNCTION__, RCMarvelAPITestPublicKey);
}

@end
