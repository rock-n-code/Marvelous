//
//  RCComicsObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCComicsObject.h"

@interface RCComicsObject ()

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSNumber *digitalIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *issueNumber;
@property (nonatomic, strong) NSString *summary;
@property (nonatomic, strong) NSString *variantDescription;
@property (nonatomic, strong) NSDate *lastModified;
@property (nonatomic, strong) NSString *isbn;
@property (nonatomic, strong) NSString *upc;
@property (nonatomic, strong) NSString *diamondCode;
@property (nonatomic, strong) NSString *ean;
@property (nonatomic, strong) NSString *issn;
@property (nonatomic, strong) NSString *format;
@property (nonatomic, strong) NSNumber *pageCount;
@property (nonatomic, strong) NSArray *textObjects;
@property (nonatomic, strong) NSURL *resourceURI;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) RCSummaryObject *series;
@property (nonatomic, strong) NSArray *variants;
@property (nonatomic, strong) NSArray *collections;
@property (nonatomic, strong) NSArray *collectedIssues;
@property (nonatomic, strong) NSArray *dates;
@property (nonatomic, strong) NSArray *prices;
@property (nonatomic, strong) RCImageObject *thumbnail;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) RCListObject *creators;
@property (nonatomic, strong) RCListObject *characters;
@property (nonatomic, strong) RCListObject *stories;
@property (nonatomic, strong) RCListObject *events;

@end

@implementation RCComicsObject

@end
