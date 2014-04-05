//
//  RCStoryFilter.h
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCFilter.h"

@interface RCStoryFilter : RCFilter

@property (nonatomic, strong) NSArray *comics;
@property (nonatomic, strong) NSArray *series;
@property (nonatomic, strong) NSArray *events;
@property (nonatomic, strong) NSArray *creators;
@property (nonatomic, strong) NSArray *characters;

@end
