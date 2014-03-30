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

@property (nonatomic, assign) RCAPIOperationTypes type;
@property (nonatomic, copy) jsonCompletionBlock jsonCompletion;

@property (nonatomic, strong, readonly) NSURL *url;
@property (nonatomic, strong, readonly) NSDictionary *filter;
@property (nonatomic, strong, readonly) NSDictionary *json;

- (id)initWithURL:(NSURL *)url andFilter:(NSDictionary *)filter;

@end
