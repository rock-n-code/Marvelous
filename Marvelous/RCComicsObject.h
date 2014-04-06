//
//  RCComicsObject.h
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCObject.h"
#import "RCSummaryObject.h"
#import "RCImageObject.h"
#import "RCListObject.h"

@interface RCComicsObject : RCObject

@property (nonatomic, readonly, strong) NSNumber *identifier;
@property (nonatomic, readonly, strong) NSNumber *digitalIdentifier;
@property (nonatomic, readonly, strong) NSString *title;
@property (nonatomic, readonly, strong) NSNumber *issueNumber;
@property (nonatomic, readonly, strong) NSString *summary;
@property (nonatomic, readonly, strong) NSString *variantDescription;
@property (nonatomic, readonly, strong) NSDate *lastModified;
@property (nonatomic, readonly, strong) NSString *isbn;
@property (nonatomic, readonly, strong) NSString *upc;
@property (nonatomic, readonly, strong) NSString *diamondCode;
@property (nonatomic, readonly, strong) NSString *ean;
@property (nonatomic, readonly, strong) NSString *issn;
@property (nonatomic, readonly, strong) NSString *format;
@property (nonatomic, readonly, strong) NSNumber *pageCount;
@property (nonatomic, readonly, strong) NSArray *textObjects;
@property (nonatomic, readonly, strong) NSURL *resourceURI;
@property (nonatomic, readonly, strong) NSArray *urls;
@property (nonatomic, readonly, strong) RCSummaryObject *series;
@property (nonatomic, readonly, strong) NSArray *variants;
@property (nonatomic, readonly, strong) NSArray *collections;
@property (nonatomic, readonly, strong) NSArray *collectedIssues;
@property (nonatomic, readonly, strong) NSArray *dates;
@property (nonatomic, readonly, strong) NSArray *prices;
@property (nonatomic, readonly, strong) RCImageObject *thumbnail;
@property (nonatomic, readonly, strong) NSArray *images;
@property (nonatomic, readonly, strong) RCListObject *creators;
@property (nonatomic, readonly, strong) RCListObject *characters;
@property (nonatomic, readonly, strong) RCListObject *stories;
@property (nonatomic, readonly, strong) RCListObject *events;

@end
