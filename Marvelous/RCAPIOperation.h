//
//  RCAPIOperation.h
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCOperation.h"
#import "RCAPIOperationTypes.h"

typedef void (^jsonCompletionBlock) (NSDictionary *dictionary, NSError *error);

@interface RCAPIOperation : RCOperation

@property (nonatomic, copy) jsonCompletionBlock completionBlock;

@property (nonatomic, readonly, strong) NSString *identifier;
@property (nonatomic, readonly, strong) NSString *publicKey;
@property (nonatomic, readonly, strong) NSURL *url;
@property (nonatomic, readonly, strong) NSDictionary *filter;
@property (nonatomic, readonly, strong) NSDictionary *json;
@property (nonatomic, readonly) RCAPIOperationTypes type;

- (id)initWithType:(RCAPIOperationTypes)type identifier:(NSString *)identifier andPublicKey:(NSString *)publicKey;

@end
