//
//  RCQueryInfoObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCQueryInfoObject.h"

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
