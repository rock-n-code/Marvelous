//
//  RCComicDate.m
//  Marvelous
//
//  Created by Javier Cicchelli on 07/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCComicDate.h"

@interface RCComicDate ()

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSDate *date;

@end

@implementation RCComicDate

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];

	if (self) {
		self.type = dictionary[RCResponseKeyType];
		self.date = [self dateFromString:dictionary[RCResponseKeyDate]];
	}

	return self;
}

@end
