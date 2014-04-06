//
//  RCCreatorFilter.h
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCFilter.h"

@interface RCCreatorFilter : RCFilter

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *middleName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *suffix;
@property (nonatomic, strong) NSString *nameStartsWith;
@property (nonatomic, strong) NSString *firstNameStartsWith;
@property (nonatomic, strong) NSString *middleNameStartsWith;
@property (nonatomic, strong) NSString *lastNameStartsWith;
@property (nonatomic, strong) NSArray *comics;
@property (nonatomic, strong) NSArray *series;
@property (nonatomic, strong) NSArray *events;
@property (nonatomic, strong) NSArray *stories;

@end
