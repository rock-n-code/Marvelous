//
//  RCAPIOperation.h
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCOperation.h"
#import "RCAPITypes.h"

typedef void (^operationCompletionBlock) (NSArray *results, NSError *error);

@interface RCAPIOperation : RCOperation

@property (nonatomic, copy) operationCompletionBlock completionBlock;

@property (nonatomic, readonly, strong) NSString *identifier;
@property (nonatomic, readonly, strong) NSString *publicKey;
@property (nonatomic, readonly, strong) NSURL *url;
@property (nonatomic, readonly, strong) NSDictionary *filter;
@property (nonatomic, readonly, strong) NSDictionary *json;
@property (nonatomic, readonly, strong) NSArray *results;
@property (nonatomic, readonly) RCAPITypes type;

- (id)initWithType:(RCAPITypes)type identifier:(NSString *)identifier andPublicKey:(NSString *)publicKey;

@end
