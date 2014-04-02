//
//  RCImageObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCImageObject.h"
static NSString * const RCImageObjectPathFormat = @"%@.%@";
static NSString * const RCImageObjectPathSeparatorFormat = @"%@/%@.%@";

@interface RCImageObject ()

@property (nonatomic, strong) NSString *basePath;
@property (nonatomic, strong) NSString *extension;

@end

@implementation RCImageObject

#pragma mark - Properties

- (NSURL *)fullSizeURL
{
	if (!self.basePath || !self.extension) {
		return nil;
	}

	NSString *path = [NSString stringWithFormat:RCImageObjectPathFormat, self.basePath, self.extension];

	return [NSURL URLWithString:path];
}

- (NSURL *)detailURL
{
	if (!self.basePath || !self.extension) {
		return nil;
	}
	
	NSString *path = [NSString stringWithFormat:RCImageObjectPathSeparatorFormat, self.basePath, RCImageModeDetail, self.extension];

	return [NSURL URLWithString:path];
}
@end
