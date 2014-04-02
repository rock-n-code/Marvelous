//
//  RCObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCObject.h"
#import "RCURLObject.h"

@interface RCObject ()

@end

@implementation RCObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];

	if (self) {
		// ...
	}

	return self;
}

#pragma mark - Public methods

- (NSDate *)dateFromString:(NSString *)string
{
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];

	formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";

	return [formatter dateFromString:string];
}

- (NSArray *)urlsFromArray:(NSArray *)array
{
	NSMutableArray *urls = [NSMutableArray array];

	[array enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger index, BOOL *stop) {
		RCURLObject *url = [[RCURLObject alloc] initWithDictionary:dictionary];

		[urls addObject:url];
	}];

	return urls;
}

@end
