//
//  RCListObject.h
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCObject.h"

@interface RCListObject : RCObject

@property (nonatomic, readonly, strong) NSNumber *available;
@property (nonatomic, readonly, strong) NSNumber *returned;
@property (nonatomic, readonly, strong) NSURL *collectionURI;
@property (nonatomic, readonly, strong) NSArray *items;

@end
