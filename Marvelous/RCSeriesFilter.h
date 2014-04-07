//
//  RCSeriesFilter.h
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCFilter.h"
#import "RCFormatTypeCodes.h"
#import "RCSeriesTypeCodes.h"

@interface RCSeriesFilter : RCFilter

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *titleStartsWith;
@property (nonatomic, strong) NSNumber *startYear;
@property (nonatomic, strong) NSArray *comics;
@property (nonatomic, strong) NSArray *stories;
@property (nonatomic, strong) NSArray *events;
@property (nonatomic, strong) NSArray *creators;
@property (nonatomic, strong) NSArray *characters;
@property (nonatomic, strong) NSArray *contains;
@property (nonatomic) RCSeriesTypeCodes seriesType;

@end
