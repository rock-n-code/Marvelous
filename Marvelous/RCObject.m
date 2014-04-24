//
//  RCObject.m
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

#import "RCObject.h"
#import "RCURLObject.h"

@interface RCObject ()

@end

@implementation RCObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	if (![self isValidObject:dictionary]) {
		return nil;
	}
	
	return [super init];
}

#pragma mark - Public methods

- (NSDate *)dateFromString:(NSString *)string
{
	if (![self isValidObject:string]) {
		return nil;
	}
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	NSString *format = @"yyyy-MM-dd'T'HH:mm:ssZ";
	NSRange rangeWhitespace = [string rangeOfString:@" "];

	if (rangeWhitespace.location != NSNotFound) {
		format = @"yyyy-MM-dd HH:mm:ss";
	}

	formatter.dateFormat = format;

	return [formatter dateFromString:string];
}

- (NSArray *)urlsFromArray:(NSArray *)array
{
	if (![self isValidObject:array]) {
		return nil;
	}
	
	NSMutableArray *urls = [NSMutableArray array];

	[array enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger index, BOOL *stop) {
		RCURLObject *url = [[RCURLObject alloc] initWithDictionary:dictionary];

		[urls addObject:url];
	}];

	return urls;
}

- (BOOL)isValidObject:(id)object
{
	return object && object != [NSNull null];
}

@end
