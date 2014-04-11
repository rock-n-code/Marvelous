//
//  RCOperationTests.m
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

#import "RCOperation.h"
#import "RCOperationErrors.h"
#import "RCOperationErrorCodes.h"

@interface RCOperationTests : XCTestCase

@property (nonatomic, strong) RCOperation *operation;

@end

@implementation RCOperationTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
	self.operation = nil;

	[super tearDown];
}

- (void)testMain
{
	self.operation = [[RCOperation alloc] init];

	[self.operation main];

	XCTAssertNil(self.operation.error, @"\"%s\" is expecting the property 'error' to have the NULL value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isConcurrent, @"\"%s\" is expecting the property 'isConcurrent' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertTrue(self.operation.isExecuting, @"\"%s\" is expecting the property 'isExecuting' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isCancelled, @"\"%s\" is expecting the property 'isCancelled' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isFinished, @"\"%s\" is expecting the property 'isFinished' to have the YES value.", __PRETTY_FUNCTION__);

	[self.operation finish];
}

- (void)testNonConcurrentCancel
{
	self.operation = [[RCOperation alloc] init];

	[self.operation main];
	[self.operation cancel];

	XCTAssertNil(self.operation.error, @"\"%s\" is expecting the property 'error' to have the NULL value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isConcurrent, @"\"%s\" is expecting the property 'isConcurrent' to have the NO value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isExecuting, @"\"%s\" is expecting the property 'isExecuting' to have the NO value.", __PRETTY_FUNCTION__);
	XCTAssertTrue(self.operation.isCancelled, @"\"%s\" is expecting the property 'isCancelled' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertTrue(self.operation.isFinished, @"\"%s\" is expecting the property 'isFinished' to have the YES value.", __PRETTY_FUNCTION__);
}

- (void)testNonConcurrentFinish
{
	self.operation = [[RCOperation alloc] init];

	[self.operation main];
	[self.operation finish];

	XCTAssertNil(self.operation.error, @"\"%s\" is expecting the property 'error' to have the NULL value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isConcurrent, @"\"%s\" is expecting the property 'isConcurrent' to have the NO value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isExecuting, @"\"%s\" is expecting the property 'isExecuting' to have the NO value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isCancelled, @"\"%s\" is expecting the property 'isCancelled' to have the NO value.", __PRETTY_FUNCTION__);
	XCTAssertTrue(self.operation.isFinished, @"\"%s\" is expecting the property 'isFinished' to have the YES value.", __PRETTY_FUNCTION__);
}

- (void)testStart
{
	self.operation = [[RCOperation alloc] init];

	[self.operation start];

	XCTAssertNil(self.operation.error, @"\"%s\" is expecting the property 'error' to have the NULL value.", __PRETTY_FUNCTION__);
	XCTAssertTrue(self.operation.isConcurrent, @"\"%s\" is expecting the property 'isConcurrent' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertTrue(self.operation.isExecuting, @"\"%s\" is expecting the property 'isExecuting' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isCancelled, @"\"%s\" is expecting the property 'isCancelled' to have the NO value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isFinished, @"\"%s\" is expecting the property 'isFinished' to have the NO value.", __PRETTY_FUNCTION__);

	[self.operation finish];
}

- (void)testConcurrentCancel
{
	self.operation = [[RCOperation alloc] init];

	[self.operation start];
	[self.operation cancel];

	XCTAssertNil(self.operation.error, @"\"%s\" is expecting the property 'error' to have the NULL value.", __PRETTY_FUNCTION__);
	XCTAssertTrue(self.operation.isConcurrent, @"\"%s\" is expecting the property 'isConcurrent' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isExecuting, @"\"%s\" is expecting the property 'isExecuting' to have the NO value.", __PRETTY_FUNCTION__);
	XCTAssertTrue(self.operation.isCancelled, @"\"%s\" is expecting the property 'isCancelled' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertTrue(self.operation.isFinished, @"\"%s\" is expecting the property 'isFinished' to have the YES value.", __PRETTY_FUNCTION__);
}

- (void)testConcurrentFinish
{
	self.operation = [[RCOperation alloc] init];

	[self.operation start];
	[self.operation finish];

	XCTAssertNil(self.operation.error, @"\"%s\" is expecting the property 'error' to have the NULL value.", __PRETTY_FUNCTION__);
	XCTAssertTrue(self.operation.isConcurrent, @"\"%s\" is expecting the property 'isConcurrent' to have the YES value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isExecuting, @"\"%s\" is expecting the property 'isExecuting' to have the NO value.", __PRETTY_FUNCTION__);
	XCTAssertFalse(self.operation.isCancelled, @"\"%s\" is expecting the property 'isCancelled' to have the NO value.", __PRETTY_FUNCTION__);
	XCTAssertTrue(self.operation.isFinished, @"\"%s\" is expecting the property 'isFinished' to have the YES value.", __PRETTY_FUNCTION__);
}

- (void)testErrorWithCodeAndUserInfo
{
	NSDictionary *userInfo = @{NSLocalizedDescriptionKey: RCOperationErrorTypeUndefined};

	self.operation = [[RCOperation alloc] init];

	[self.operation start];
	[self.operation errorWithCode:RCOperationErrorCodeTypeUndefined andUserInfo:userInfo];
	[self.operation finish];

	XCTAssertNotNil(self.operation.error, @"\"%s\" is expecting the property 'error' to have the NULL value.", __PRETTY_FUNCTION__);
}

@end