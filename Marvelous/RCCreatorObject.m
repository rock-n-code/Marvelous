//
//  RCCreatorObject.m
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCCreatorObject.h"

@interface RCCreatorObject ()

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *middleName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *suffix;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSDate *lastModified;
@property (nonatomic, strong) NSURL *resourceURI;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) RCImageObject *thumbnail;
@property (nonatomic, strong) RCListObject *comics;
@property (nonatomic, strong) RCListObject *stories;
@property (nonatomic, strong) RCListObject *series;
@property (nonatomic, strong) RCListObject *events;

@end

@implementation RCCreatorObject

@end
