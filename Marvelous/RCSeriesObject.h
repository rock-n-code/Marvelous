//
//  RCSeriesObject.h
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCObject.h"
#import "RCImageObject.h"
#import "RCListObject.h"
#import "RCSummaryObject.h"

@interface RCSeriesObject : RCObject

@property (nonatomic, readonly, strong) NSNumber *identifier;
@property (nonatomic, readonly, strong) NSString *title;
@property (nonatomic, readonly, strong) NSString *summary;
@property (nonatomic, readonly, strong) NSURL *resourceURI;
@property (nonatomic, readonly, strong) NSArray *urls;
@property (nonatomic, readonly, strong) NSNumber *startYear;
@property (nonatomic, readonly, strong) NSNumber *endYear;
@property (nonatomic, readonly, strong) NSString *rating;
@property (nonatomic, readonly, strong) NSDate *lastModified;
@property (nonatomic, readonly, strong) RCImageObject *thumbnail;
@property (nonatomic, readonly, strong) RCListObject *comics;
@property (nonatomic, readonly, strong) RCListObject *stories;
@property (nonatomic, readonly, strong) RCListObject *events;
@property (nonatomic, readonly, strong) RCListObject *characters;
@property (nonatomic, readonly, strong) RCListObject *creators;
@property (nonatomic, readonly, strong) RCSummaryObject *previous;
@property (nonatomic, readonly, strong) RCSummaryObject *next;

@end