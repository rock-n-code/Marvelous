//
//  RCDataWrapperObject.m
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

#import "RCDataWrapperObject.h"
#import "RCResponseKeys.h"

@interface RCDataWrapperObject ()

@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *copyright;
@property (nonatomic, strong) NSString *attributionText;
@property (nonatomic, strong) NSString *attributionHTML;
@property (nonatomic, strong) RCDataContainerObject *data;
@property (nonatomic, strong) NSString *etag;

@end

@implementation RCDataWrapperObject

#pragma mark - NSObject

- (id)initWithType:(RCAPITypes)type andDictionary:(NSDictionary *)dictionary
{
	if (type == RCAPITypeUndefined || ![self isValidObject:dictionary]) {
		return nil;
	}

	self = [super init];

	if (self) {
		self.code = dictionary[RCResponseKeyCode];
		self.status = dictionary[RCResponseKeyStatus];
		self.copyright = dictionary[RCResponseKeyCopyright];
		self.attributionText = dictionary[RCResponseKeyAttributionText];
		self.attributionHTML = dictionary[RCResponseKeyAttributionHTML];
		self.data = [[RCDataContainerObject alloc] initWithType:type andDictionary:dictionary[RCResponseKeyData]];
		self.etag = dictionary[RCResponseKeyETag];
	}

	return self;
}

@end
