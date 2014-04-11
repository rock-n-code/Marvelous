//
//  RCImageObjectTests.m
//  Marvelous
//
//  Copyright (c) 2014 Rock & Code [http://rock-n-code.com]
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
