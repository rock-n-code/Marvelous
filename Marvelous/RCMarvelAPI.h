//
//  RCMarvelAPI.h
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCCharacterObject.h"
#import "RCCreatorObject.h"
#import "RCEventObject.h"
#import "RCStoryObject.h"
#import "RCQueryInfoObject.h"
#import "RCCharacterFilter.h"
#import "RCCreatorFilter.h"
#import "RCEventFilter.h"
#import "RCStoryFilter.h"

typedef void (^resultCompletionBlock) (id result, RCQueryInfoObject *info, NSError *error);
typedef void (^resultsCompletionBlock) (NSArray *results, RCQueryInfoObject *info, NSError *error);

@interface RCMarvelAPI : NSObject

@property (nonatomic, strong) NSString *publicKey;
@property (nonatomic, strong) NSString *privateKey;

@property (nonatomic, readonly, strong) NSString *version;

+ (RCMarvelAPI *)api;

- (void)characterByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;
- (void)charactersByFilter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)charactersByEventIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)charactersByStoryIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

- (void)eventByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;
- (void)eventsByFilter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)eventsByCharacterIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)eventsByCreatorIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)eventsByStoryIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

- (void)storyByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;
- (void)storiesByFilter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)storiesByCharacterIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)storiesByCreatorIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)storiesByEventIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

@end