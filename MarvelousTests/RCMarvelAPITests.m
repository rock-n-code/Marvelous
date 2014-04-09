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

- (void)testCharactersByComicIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByInvalidComicIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByNilComicIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByComicIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByComicIdentifierNilFilterAndCompletionBlock
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

- (void)testCharactersBySeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByInvalidSeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersByNilSeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersBySeriesIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCharactersBySeriesIdentifierNilFilterAndCompletionBlock
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

- (void)testComicByIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicByInvalidIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicByNilIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByCharacterIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByInvalidCharacterIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByNilCharacterIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByCharacterIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByCharacterIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByCreatorIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByInvalidCreatorIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByNilCreatorIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByCreatorIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByCreatorIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByInvalidEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByNilEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByEventIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByEventIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsBySeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByInvalidSeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByNilSeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsBySeriesIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsBySeriesIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByInvalidStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByNilStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByStoryIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testComicsByStoryIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorByIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorByInvalidIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorByNilIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByComicIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByInvalidComicIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByNilComicIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByComicIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByComicIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByInvalidEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByNilEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByEventIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByEventIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsBySeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByInvalidSeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByNilSeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsBySeriesIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsBySeriesIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByInvalidStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByNilStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByStoryIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testCreatorsByStoryIdentifierNilFilterAndCompletionBlock
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

- (void)testEventsByComicIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByInvalidComicIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilComicIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByComicIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByComicIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByCreatorIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByInvalidCreatorIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilCreatorIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByCreatorIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByCreatorIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsBySeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByInvalidSeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsByNilSeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsBySeriesIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testEventsBySeriesIdentifierNilFilterAndCompletionBlock
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

- (void)testSeriesByIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByInvalidIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByCharacterIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByInvalidCharacterIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByNilCharacterIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByCharacterIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByCharacterIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByCreatorIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByInvalidCreatorIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByNilCreatorIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByCreatorIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByCreatorIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByInvalidEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByNilEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByEventIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByEventIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByInvalidStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByNilStoryIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByStoryIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testSeriesByStoryIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByInvalidIdentifierAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByCharacterIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByInvalidCharacterIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByNilCharacterIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByCharacterIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByCharacterIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByComicIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByInvalidComicIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByNilComicIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByComicIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByComicIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByCreatorIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByInvalidCreatorIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByNilCreatorIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByCreatorIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByCreatorIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByInvalidEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByNilEventIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByEventIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByEventIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesBySeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByInvalidSeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesByNilSeriesIdentifierFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesBySeriesIdentifierBadFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

- (void)testStoriesBySeriesIdentifierNilFilterAndCompletionBlock
{
	XCTFail(@"Will write the test when I found a way to test asynchronous code with XCTest framework.");
}

@end
