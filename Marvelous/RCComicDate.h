//
//  RCComicDate.h
//  Marvelous
//
//  Created by Javier Cicchelli on 07/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCObject.h"

@interface RCComicDate : RCObject

@property (nonatomic, readonly, strong) NSString *type;
@property (nonatomic, readonly, strong) NSDate *date;

@end
