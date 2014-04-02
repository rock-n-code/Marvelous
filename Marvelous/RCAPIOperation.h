//
//  RCAPIOperation.h
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCOperation.h"
#import "RCFilter.h"
#import "RCDataWrapperObject.h"
#import "RCAPITypes.h"

typedef void (^operationCompletionBlock) (RCDataWrapperObject *data, NSError *error);

@interface RCAPIOperation : RCOperation

@property (nonatomic, copy) operationCompletionBlock completionBlock;

@property (nonatomic, readonly, strong) NSString *identifier;
@property (nonatomic, readonly, strong) NSURL *url;
@property (nonatomic, readonly, strong) NSDictionary *parameters;
@property (nonatomic, readonly, strong) RCFilter *filter;
@property (nonatomic, readonly, strong) RCDataWrapperObject *data;
@property (nonatomic, readonly) RCAPITypes type;

- (id)initWithFilter:(RCFilter *)filter andAuthentication:(NSDictionary *)authentication;
- (id)initWithType:(RCAPITypes)type identifier:(NSString *)identifier andAuthentication:(NSDictionary *)authentication;
- (id)initWithType:(RCAPITypes)type identifier:(NSString *)identifier filter:(RCFilter *)filter andAuthentication:(NSDictionary *)authentication;

@end
