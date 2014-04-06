//
//  RCComicPriceTests.m
//  Marvelous
//
//  Created by Javier Cicchelli on 07/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "RCComicPrice.h"

@interface RCComicPriceTests : XCTestCase

@end

@implementation RCComicPriceTests

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
	RCComicPrice *comicPrice = [[RCComicPrice alloc] init];
	
    XCTAssertNil(comicPrice.type, @"\"%s\" is expecting the property 'type' to be NULL.", __PRETTY_FUNCTION__);
	XCTAssertNil(comicPrice.price, @"\"%s\" is expecting the property 'price' to be NULL.", __PRETTY_FUNCTION__);
}

@end
