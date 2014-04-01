//
//  RCDataContainerObject.h
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCAPITypes.h"

@interface RCDataContainerObject : NSObject

@property (nonatomic, readonly, strong) NSNumber *offset;
@property (nonatomic, readonly, strong) NSNumber *limit;
@property (nonatomic, readonly, strong) NSNumber *total;
@property (nonatomic, readonly, strong) NSNumber *count;
@property (nonatomic, readonly, strong) NSArray *results;

- (id)initWithType:(RCAPITypes)type andDictionary:(NSDictionary *)dictionary;

@end
