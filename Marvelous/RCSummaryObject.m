//
//  RCSummaryObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCSummaryObject.h"

@interface RCSummaryObject ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *role;
@property (nonatomic, strong) NSURL *resourceURI;

@end

@implementation RCSummaryObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super initWithDictionary:dictionary];

	if (self) {
		self.name = dictionary[RCResponseKeyName];
		self.type = dictionary[RCResponseKeyType];
		self.role = dictionary[RCResponseKeyRole];
		self.resourceURI = [NSURL URLWithString:dictionary[RCResponseKeyResourceURI]];
	}

	return self;
}

@end
