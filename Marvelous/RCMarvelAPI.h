//
//  RCMarvelAPI.h
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCCharacterObject.h"
#import "RCEventObject.h"
#import "RCQueryInfoObject.h"
#import "RCCharacterFilter.h"
#import "RCEventFilter.h"

typedef void (^resultCompletionBlock) (id result, RCQueryInfoObject *info, NSError *error);
typedef void (^resultsCompletionBlock) (NSArray *results, RCQueryInfoObject *info, NSError *error);

@interface RCMarvelAPI : NSObject

@property (nonatomic, strong) NSString *publicKey;
@property (nonatomic, strong) NSString *privateKey;

@property (nonatomic, readonly, strong) NSString *version;

+ (RCMarvelAPI *)api;

- (void)getCharacterByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;
- (void)getCharactersByFilter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)getEventsWithCharacterIdentifier:(NSNumber *)identifier andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)getEventsWithFilter:(RCEventFilter *)filter characterIdentifier:(NSNumber *)identifier andCompletionBlock:(resultsCompletionBlock)completionBlock;

@end
