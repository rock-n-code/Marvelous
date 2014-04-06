//
//  RCCreatorObject.h
//  Marvelous
//
//  Created by Javier Cicchelli on 06/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCObject.h"
#import "RCImageObject.h"
#import "RCListObject.h"

@interface RCCreatorObject : RCObject

@property (nonatomic, readonly, strong) NSNumber *identifier;
@property (nonatomic, readonly, strong) NSString *firstName;
@property (nonatomic, readonly, strong) NSString *middleName;
@property (nonatomic, readonly, strong) NSString *lastName;
@property (nonatomic, readonly, strong) NSString *suffix;
@property (nonatomic, readonly, strong) NSString *fullName;
@property (nonatomic, readonly, strong) NSDate *lastModified;
@property (nonatomic, readonly, strong) NSURL *resourceURI;
@property (nonatomic, readonly, strong) NSArray *urls;
@property (nonatomic, readonly, strong) RCImageObject *thumbnail;
@property (nonatomic, readonly, strong) RCListObject *comics;
@property (nonatomic, readonly, strong) RCListObject *stories;
@property (nonatomic, readonly, strong) RCListObject *series;
@property (nonatomic, readonly, strong) RCListObject *events;

@end
