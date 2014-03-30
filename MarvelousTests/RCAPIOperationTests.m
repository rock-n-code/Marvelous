//
//  RCAPIOperationTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCAPIOperation.h"
#import "RCRequestKeys.h"
#import "RCAPIOperationTestValues.h"

@interface RCAPIOperationTests : XCTestCase

@property (nonatomic, strong) RCAPIOperation *operation;

@end

@implementation RCAPIOperationTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
	self.operation = nil;
	
	[super tearDown];
}

- (void)testInit
{
	self.operation = [[RCAPIOperation alloc] init];

	XCTAssertEqual(self.operation.type, RCAPIOperationTypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPIOperationTypeUndefined);
	XCTAssertNil(self.operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.publicKey, @"\"%s\" is expecting the property 'publicKey' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.json, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypePublicKeyAndIdentifier
{
	NSString *testURLString = [NSString stringWithFormat:@"https://gateway.marvel.com/v1/public/characters/%@?apikey=%@", RCAPIOperationTestValueIdentifier, RCAPIOperationTestValuePublicKey];
	NSURL *testURL = [NSURL URLWithString:testURLString];
	NSDictionary *testFilter = @{RCRequestKeyAPIKey: RCAPIOperationTestValuePublicKey};

	self.operation = [[RCAPIOperation alloc] initWithType:RCAPIOperationTypeCharacters publicKey:RCAPIOperationTestValuePublicKey andIdentifier:RCAPIOperationTestValueIdentifier];

	XCTAssertEqual(self.operation.type, RCAPIOperationTypeCharacters, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPIOperationTypeCharacters);
	XCTAssertEqualObjects(self.operation.identifier, RCAPIOperationTestValueIdentifier, @"\"%s\" is expecting the property 'type' to have the '%@' string value.", __PRETTY_FUNCTION__, RCAPIOperationTestValueIdentifier);
	XCTAssertEqualObjects(self.operation.publicKey, RCAPIOperationTestValuePublicKey, @"\"%s\" is expecting the property 'publicKey' to have the '%@' string value.", __PRETTY_FUNCTION__, RCAPIOperationTestValuePublicKey);
	XCTAssertEqualObjects(self.operation.url, testURL, @"\"%s\" is expecting the property 'url' to have a NSURL instance.", __PRETTY_FUNCTION__);
	XCTAssertEqualObjects(self.operation.filter, testFilter, @"\"%s\" is expecting the property 'filter' to have a NSDictionary instance.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.json, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.error, @"\"%s\" is expecting the property 'error' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithUndefinedTypePublicKeyAndIdentifier
{
	self.operation = [[RCAPIOperation alloc] initWithType:RCAPIOperationTypeUndefined publicKey:RCAPIOperationTestValuePublicKey andIdentifier:RCAPIOperationTestValueIdentifier];

	XCTAssertEqual(self.operation.type, RCAPIOperationTypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPIOperationTypeUndefined);
	XCTAssertNil(self.operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.publicKey, @"\"%s\" is expecting the property 'publicKey' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.json, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(self.operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithTypeNilPublicKeyAndIdentifier
{
	self.operation = [[RCAPIOperation alloc] initWithType:RCAPIOperationTypeUndefined publicKey:nil andIdentifier:RCAPIOperationTestValueIdentifier];

	XCTAssertEqual(self.operation.type, RCAPIOperationTypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPIOperationTypeUndefined);
	XCTAssertNil(self.operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.publicKey, @"\"%s\" is expecting the property 'publicKey' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.json, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(self.operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithUndefinedTypePublicKeyAndNilIdentifier
{
	self.operation = [[RCAPIOperation alloc] initWithType:RCAPIOperationTypeUndefined publicKey:RCAPIOperationTestValuePublicKey andIdentifier:nil];

	XCTAssertEqual(self.operation.type, RCAPIOperationTypeUndefined, @"\"%s\" is expecting the property 'type' to have the '%d' integer value.", __PRETTY_FUNCTION__, RCAPIOperationTypeUndefined);
	XCTAssertNil(self.operation.identifier, @"\"%s\" is expecting the property 'identifier' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.publicKey, @"\"%s\" is expecting the property 'publicKey' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.url, @"\"%s\" is expecting the property 'url' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.filter, @"\"%s\" is expecting the property 'filter' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(self.operation.json, @"\"%s\" is expecting the property 'json' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(self.operation.error, @"\"%s\" is expecting the property 'error' to not be NULL.", __PRETTY_FUNCTION__);
}

@end
