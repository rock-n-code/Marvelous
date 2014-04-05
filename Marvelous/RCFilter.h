//
//  RCFilter.h
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCOrderByTypeCodes.h"
#import "RCAPITypes.h"
#import "RCRequestKeys.h"

@interface RCFilter : NSObject

@property (nonatomic, strong) NSDate *modifiedSince;
@property (nonatomic, strong) NSNumber *limit;
@property (nonatomic, strong) NSNumber *offset;
@property (nonatomic) RCOrderByTypeCodes orderBy;

@property (nonatomic, readonly, strong) NSDictionary *parameters;
@property (nonatomic, readonly, strong) NSArray *validOrderTypes;
@property (nonatomic, readonly) RCAPITypes type;

@end
