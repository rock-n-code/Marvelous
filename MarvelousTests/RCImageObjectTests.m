//
//  RCImageObjectTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCImageObject.h"

@interface RCImageObjectTests : XCTestCase

@end

@implementation RCImageObjectTests

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
	RCImageObject *image = [[RCImageObject alloc] init];

	XCTAssertNil(image.basePath, @"\"%s\" is expecting the property 'basePath' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(image.extension, @"\"%s\" is expecting the property 'extension' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(image.fullSizeURL, @"\"%s\" is expecting the property 'fullSizeURL' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(image.detailURL, @"\"%s\" is expecting the property 'detailURL' to be NULL.", __PRETTY_FUNCTION__);
}

- (void)testInitWithDictionary
{
	NSDictionary *dictionary = @{RCResponseKeyPath: @"http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73",
								 RCResponseKeyExtension: @"jpg"};

	RCImageObject *image = [[RCImageObject alloc] initWithDictionary:dictionary];

	XCTAssertNotNil(image.basePath, @"\"%s\" is expecting the property 'basePath' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(image.extension, @"\"%s\" is expecting the property 'extension' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(image.fullSizeURL, @"\"%s\" is expecting the property 'fullSizeURL' to be not NULL.", __PRETTY_FUNCTION__);
	XCTAssertNotNil(image.detailURL, @"\"%s\" is expecting the property 'detailURL' to be not NULL.", __PRETTY_FUNCTION__);
}

- (void)testURLForModeAndSize
{
	NSDictionary *dictionary = @{RCResponseKeyPath: @"http://i.annihil.us/u/prod/marvel/i/mg/3/40/4bb4680432f73",
								 RCResponseKeyExtension: @"jpg"};

	RCImageObject *image = [[RCImageObject alloc] initWithDictionary:dictionary];
	NSURL *url = [image urlForMode:RCImageModeCodeSquare andSize:RCImageSizeCodeSmall];

	XCTAssertNotNil(url, @"\"%s\" is expecting the variable 'url' to be not NULL.", __PRETTY_FUNCTION__);
}

@end
