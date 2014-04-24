//
//  RCImageObject.m
//  Marvelous
//
//  Copyright (c) 2014 Rock & Code [http://rock-n-code.com]
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "RCImageObject.h"
#import "RCImageAspectRatios.h"
#import "RCImageSizes.h"
#import "RCResponseKeys.h"

/*!
 @constant
 
 This constant defines a path format for a base path and an extension.

 @internal
 */
static NSString * const RCImageObjectPathFormat = @"%@.%@";

/*!
 @constant

 This constant defines a path format for a base path, a stringfied aspect ratio and an extension.

 @internal
 */
static NSString * const RCImageObjectPathSeparatorFormat = @"%@/%@.%@";

/*!
 @constant

 This constant defines a path format for a base path, a stringfied aspect ratio, a stringfied size and an extension.

 @internal
 */
static NSString * const RCImageObjectPathModeSizeFormat = @"%@/%@_%@.%@";

@interface RCImageObject ()

@property (nonatomic, strong) NSString *basePath;
@property (nonatomic, strong) NSString *extension;

@end

@implementation RCImageObject

#pragma mark - RCObjectProtocol

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	if (![self isValidObject:dictionary]) {
		return nil;
	}

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
	
	NSString *path = [NSString stringWithFormat:RCImageObjectPathSeparatorFormat, self.basePath, RCImageAspectRatioDetail, self.extension];

	return [NSURL URLWithString:path];
}

#pragma mark - Public methods

- (NSURL *)urlForAspectRatio:(RCImageAspectRatioCodes)aspectRatio andSize:(RCImageSizeCodes)size
{
	if (!self.basePath || !self.extension) {
		return nil;
	}
	
	NSString *stringfiedMode = [self aspectRatioFromCode:aspectRatio];
	NSString *stringfiedSize = [self sizeForCode:size];
	NSString *path = [NSString stringWithFormat:RCImageObjectPathModeSizeFormat, self.basePath, stringfiedMode, stringfiedSize, self.extension];

	return [NSURL URLWithString:path];
}

#pragma mark - Private methods

/*!
 @method
 
 This method convert a given aspect ratio code to string.
 
 @param aspectRatioCode An integer that represent a RCImageAspectRatioCodes value.
 
 @return A string that represent the given aspect ratio code.

 @internal
 */
- (NSString *)aspectRatioFromCode:(RCImageAspectRatioCodes)aspectRatioCode
{
	if (aspectRatioCode == RCImageAspectRatioCodePortrait) {
		return RCImageAspectRatioPortrait;
	} else if (aspectRatioCode == RCImageAspectRatioCodeLandscape) {
		return RCImageAspectRatioLandscape;
	} else {
		return RCImageAspectRatioSquare;
	}
}

/*!
 @method

 This method convert a given size code to string.

 @param code An integer that represent a RCImageSizeCodes value.

 @return A string that represent the given size code.

 @internal
 */
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
