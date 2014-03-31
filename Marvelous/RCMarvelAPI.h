//
//  RCMarvelAPI.h
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCMarvelAPI : NSObject

@property (nonatomic, strong) NSString *publicKey;

@property (nonatomic, readonly, strong) NSString *version;

+ (RCMarvelAPI *)api;

@end
