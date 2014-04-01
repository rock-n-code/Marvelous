//
//  RCFilter.h
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCFilterOrderByTypes.h"

@interface RCFilter : NSObject

@property (nonatomic, strong) NSNumber *limit;
@property (nonatomic, strong) NSNumber *offset;
@property (nonatomic) RCOrderByTypeCodes *orderBy;

@end
