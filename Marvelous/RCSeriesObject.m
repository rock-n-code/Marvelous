//
//  RCSeriesObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCSeriesObject.h"

@interface RCSeriesObject ()

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSURL *resourceURI;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) NSNumber *startYear;
@property (nonatomic, strong) NSNumber *endYear;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSDate *lastModified;
@property (nonatomic, strong) RCImageObject *thumbnail;
@property (nonatomic, strong) RCListObject *comics;
@property (nonatomic, strong) RCListObject *stories;
@property (nonatomic, strong) RCListObject *events;
@property (nonatomic, strong) RCListObject *characters;
@property (nonatomic, strong) RCListObject *creators;
@property (nonatomic, strong) RCSummaryObject *previous;
@property (nonatomic, strong) RCSummaryObject *next;

@end

@implementation RCSeriesObject

@end
