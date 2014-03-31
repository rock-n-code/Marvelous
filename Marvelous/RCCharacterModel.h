//
//  RCCharacterModel.h
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCListModel.h"

@interface RCCharacterModel : NSObject

@property (nonatomic, strong) NSNumber *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, strong) NSDate *lastModified;
@property (nonatomic, strong) NSURL *resourceURI;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) NSURL *thumbnail;
@property (nonatomic, strong) RCListModel *comics;
@property (nonatomic, strong) RCListModel *stories;
@property (nonatomic, strong) RCListModel *events;
@property (nonatomic, strong) RCListModel *series;

@end
