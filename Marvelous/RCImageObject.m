//
//  RCImageObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCImageObject.h"
#import "RCImageModes.h"
#import "RCImageSizes.h"

static NSString * const RCImageObjectPathFormat = @"%@.%@";
static NSString * const RCImageObjectPathSeparatorFormat = @"%@/%@.%@";
static NSString * const RCImageObjectPathModeSizeFormat = @"%@/%@_%@.%@";

@interface RCImageObject ()

@property (nonatomic, strong) NSString *basePath;
@property (nonatomic, strong) NSString *extension;

@end

@implementation RCImageObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];

	if (self) {
		self.basePath = dictionary[RCResponseKeyPath];
		self.extension = dictionary[RCResponseKeyExtension];
	}

	return self;
}

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

#pragma mark - Public methods

- (NSURL *)urlForMode:(RCImageModeCodes)mode andSize:(RCImageSizeCodes)size
{
	NSString *stringfiedMode = [self modeFromCode:mode];
	NSString *stringfiedSize = [self sizeForCode:size];
	NSString *path = [NSString stringWithFormat:RCImageObjectPathModeSizeFormat, self.basePath, stringfiedMode, stringfiedSize, self.extension];

	return [NSURL URLWithString:path];
}

#pragma mark - Private methods

- (NSString *)modeFromCode:(RCImageModeCodes)code
{
	if (code == RCImageModeCodePortrait) {
		return RCImageModePortrait;
	} else if (code == RCImageModeCodeLandscape) {
		return RCImageModeLandscape;
	} else {
		return RCImageModeSquare;
	}
}

- (NSString *)sizeForCode:(RCImageSizeCodes)code
{
	if (code == RCImageSizeCodeSmall) {
		return RCImageSizeSmall;
	} else if (code == RCImageSizeCodeMedium) {
		return RCImageSizeMedium;
	} else if (code == RCImageSizeCodeLarge) {
		return RCImageSizeLarge;
	} else if (code == RCImageSizeCodeXLarge) {
		return RCImageSizeXLarge;
	} else if (code == RCImageSizeCodeAmazing) {
		return RCImageSizeAmazing;
	} else if (code == RCImageSizeCodeFantastic) {
		return RCImageSizeFantastic;
	} else if (code == RCImageSizeCodeUncanny) {
		return RCImageSizeUncanny;
	} else {
		return RCImageSizeIncredible;
	}
}

@end
