//
//  RCImageObject.h
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCObject.h"
#import "RCImageModeCodes.h"
#import "RCImageSizeCodes.h"

@interface RCImageObject : RCObject

@property (nonatomic, readonly, strong) NSString *basePath;
@property (nonatomic, readonly, strong) NSString *extension;
@property (nonatomic, readonly, strong) NSURL *fullSizeURL;
@property (nonatomic, readonly, strong) NSURL *detailURL;

- (NSURL *)urlForMode:(RCImageModeCodes)mode andSize:(RCImageSizeCodes)size;

@end
