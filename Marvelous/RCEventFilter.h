//
//  RCEventFilter.h
//  Marvelous
//
//  Created by Javier Cicchelli on 02/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCFilter.h"

@interface RCEventFilter : RCFilter

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *nameStartsWith;
@property (nonatomic, strong) NSArray *comics;
@property (nonatomic, strong) NSArray *series;
@property (nonatomic, strong) NSArray *stories;
@property (nonatomic, strong) NSArray *creators;

@end
