//
//  RCMarvelAPITests.m
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

- (void)testCharacterByIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharacterByInvalidIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharacterByNilIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByComicIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByInvalidComicIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByNilComicIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByComicIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByComicIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByInvalidEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByNilEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByEventIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByEventIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersBySeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByInvalidSeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByNilSeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersBySeriesIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersBySeriesIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByInvalidStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByNilStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByStoryIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByStoryIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicByIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicByInvalidIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicByNilIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByCharacterIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByInvalidCharacterIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByNilCharacterIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByCharacterIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByCharacterIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByCreatorIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByInvalidCreatorIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByNilCreatorIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByCreatorIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByCreatorIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByInvalidEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByNilEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByEventIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByEventIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsBySeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByInvalidSeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByNilSeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsBySeriesIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsBySeriesIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByInvalidStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByNilStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByStoryIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByStoryIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorByIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorByInvalidIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorByNilIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByComicIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByInvalidComicIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByNilComicIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByComicIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByComicIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByInvalidEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByNilEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByEventIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByEventIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsBySeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByInvalidSeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByNilSeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsBySeriesIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsBySeriesIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByInvalidStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByNilStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByStoryIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByStoryIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByInvalidIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByCharacterIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByInvalidCharacterIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilCharacterIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByCharacterIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByCharacterIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByComicIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByInvalidComicIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilComicIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByComicIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByComicIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByCreatorIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByInvalidCreatorIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilCreatorIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByCreatorIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByCreatorIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsBySeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByInvalidSeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilSeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsBySeriesIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsBySeriesIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByInvalidStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByStoryIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByStoryIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByInvalidIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByCharacterIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByInvalidCharacterIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByNilCharacterIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByCharacterIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByCharacterIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByCreatorIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByInvalidCreatorIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByNilCreatorIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByCreatorIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByCreatorIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByInvalidEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByNilEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByEventIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByEventIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByInvalidStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByNilStoryIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByStoryIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByStoryIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByInvalidIdentifierAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByCharacterIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByInvalidCharacterIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByNilCharacterIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByCharacterIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByCharacterIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByComicIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByInvalidComicIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByNilComicIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByComicIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByComicIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByCreatorIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByInvalidCreatorIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByNilCreatorIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByCreatorIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByCreatorIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByInvalidEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByNilEventIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByEventIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByEventIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesBySeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByInvalidSeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByNilSeriesIdentifierFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesBySeriesIdentifierBadFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesBySeriesIdentifierNilFilterAndCallbackBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

@end
