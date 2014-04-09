//
//  RCMarvelAPI.h
//  Marvelous
//
//  Copyright (c) 2014 Rock & Code [http://rock-n-code.com]
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "RCCharacterObject.h"
#import "RCComicsObject.h"
#import "RCCreatorObject.h"
#import "RCEventObject.h"
#import "RCSeriesObject.h"
#import "RCStoryObject.h"
#import "RCQueryInfoObject.h"
#import "RCCharacterFilter.h"
#import "RCComicsFilter.h"
#import "RCCreatorFilter.h"
#import "RCEventFilter.h"
#import "RCSeriesFilter.h"
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
- (void)charactersByComicIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)charactersByEventIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)charactersBySeriesIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)charactersByStoryIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

- (void)comicByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;
- (void)comicsByFilter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)comicsByCharacterIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)comicsByCreatorIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)comicsByEventIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)comicsBySeriesIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)comicsByStoryIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

- (void)creatorByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;
- (void)creatorsByFilter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)creatorsByComicIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)creatorsByEventIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)creatorsBySeriesIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)creatorsByStoryIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

- (void)eventByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;
- (void)eventsByFilter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)eventsByCharacterIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)eventsByComicIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)eventsByCreatorIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)eventsBySeriesIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)eventsByStoryIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

- (void)seriesByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;
- (void)seriesByFilter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)seriesByCharacterIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)seriesByCreatorIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)seriesByEventIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)seriesByStoryIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

- (void)storyByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;
- (void)storiesByFilter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)storiesByCharacterIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)storiesByComicIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)storiesByCreatorIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)storiesByEventIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;
- (void)storiesBySeriesIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

@end