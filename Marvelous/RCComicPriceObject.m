//
//  RCComicPriceObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 07/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCComicPriceObject.h"

@interface RCComicPriceObject ()

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSNumber *price;

@end

@implementation RCComicPriceObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];

	if (self) {
		self.type = dictionary[RCResponseKeyType];
		self.price = dictionary[RCResponseKeyPrice];
	}

	return self;
}

@end
