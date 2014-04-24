//
//  RCQueryInfoObject.m
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

#import "RCQueryInfoObject.h"
#import "RCDataWrapperObject.h"
#import "RCResponseKeys.h"

@interface RCQueryInfoObject ()

@property (nonatomic, strong) NSString *copyright;
@property (nonatomic, strong) NSString *attributionText;
@property (nonatomic, strong) NSString *attributionHTML;
@property (nonatomic, strong) NSString *etag;
@property (nonatomic, strong) NSNumber *offset;
@property (nonatomic, strong) NSNumber *limit;
@property (nonatomic, strong) NSNumber *total;
@property (nonatomic, strong) NSNumber *count;

@end

@implementation RCQueryInfoObject

#pragma mark - NSObject

- (id)initWithDataWrapper:(RCDataWrapperObject *)dataWrapper
{
	if (![self isValidObject:dataWrapper]) {
		return nil;
	}

	self = [super init];

	if (self) {
		self.copyright = dataWrapper.copyright;
		self.attributionText = dataWrapper.attributionText;
		self.attributionHTML = dataWrapper.attributionHTML;
		self.etag = dataWrapper.etag;
		self.offset = dataWrapper.data.offset;
		self.limit = dataWrapper.data.limit;
		self.total = dataWrapper.data.total;
		self.count = dataWrapper.data.count;
	}

	return self;
}

@end
