//
//  RCURLObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCURLObject.h"

@interface RCURLObject ()

@property (nonatomic, strong) NSString *type;

@end

@implementation RCURLObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super initWithString:dictionary[RCResponseKeyURL]];

	if (self) {
		self.type = dictionary[RCResponseKeyType];
	}

	return self;
}

@end
