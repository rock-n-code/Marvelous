//
//  RCTextObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 07/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCTextObject.h"

@interface RCTextObject ()

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *text;

@end

@implementation RCTextObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];

	if (self) {
		self.type = dictionary[RCResponseKeyType];
		self.language = dictionary[RCResponseKeyLanguage];
		self.text = dictionary[RCResponseKeyText];
	}

	return self;
}

@end
