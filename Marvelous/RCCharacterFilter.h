//
//  RCCharacterFilter.h
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCFilter.h"

@interface RCCharacterFilter : RCFilter

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *nameStartsWith;
@property (nonatomic, strong) NSDate *modifiedSince;
@property (nonatomic, strong) NSArray *comics;
@property (nonatomic, strong) NSArray *series;
@property (nonatomic, strong) NSArray *events;
@property (nonatomic, strong) NSArray *stories;

@end
