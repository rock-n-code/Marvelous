//
//  RCAPIOperation.m
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCAPIOperation.h"

@interface RCAPIOperation ()

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSDictionary *filter;
@property (nonatomic, strong) NSDictionary *json;
@property (nonatomic, assign) RCAPIOperationTypes type;

@end

@implementation RCAPIOperation

#pragma mark - NSObject

- (id)init
{
	self = [super init];

	if (self) {
		NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];

		self.session = [NSURLSession sessionWithConfiguration:configuration];
		self.type = RCAPIOperationTypeUndefined;
	}

	return self;
}

@end
