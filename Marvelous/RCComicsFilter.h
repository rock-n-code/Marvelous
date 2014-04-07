//
//  RCComicsFilter.h
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCFilter.h"
#import "RCFormatTypeCodes.h"
#import "RCIssueTypeCodes.h"
#import "RCBooleanValueCodes.h"
#import "RCDateDescriptorCodes.h"

@interface RCComicsFilter : RCFilter

@property (nonatomic) RCFormatTypeCodes format;
@property (nonatomic) RCIssueTypeCodes formatType;
@property (nonatomic) RCBooleanValueCodes noVariants;
@property (nonatomic) RCDateDescriptorCodes dateDescriptor;
@property (nonatomic, strong) NSArray *dateRange;
@property (nonatomic, strong) NSString *diamondCode;
@property (nonatomic, strong) NSNumber *digitalIdentifier;
@property (nonatomic, strong) NSString *upc;
@property (nonatomic, strong) NSString *isbn;
@property (nonatomic, strong) NSString *ean;
@property (nonatomic, strong) NSString *issn;
@property (nonatomic) RCBooleanValueCodes hasDigitalIssue;
@property (nonatomic, strong) NSArray *creators;
@property (nonatomic, strong) NSArray *characters;
@property (nonatomic, strong) NSArray *series;
@property (nonatomic, strong) NSArray *events;
@property (nonatomic, strong) NSArray *stories;
@property (nonatomic, strong) NSArray *sharedAppearances;
@property (nonatomic, strong) NSArray *collaborators;

@end
