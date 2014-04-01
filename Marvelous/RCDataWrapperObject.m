//
//  RCDataWrapperObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
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
