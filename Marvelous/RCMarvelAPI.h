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

/*!
 @typedef resultCompletionBlock
 This block that is used as a callback and it is passed as a parameter to some of the methods of the @p RCMarvelAPI class. This particular block is used when it is required to return only one result.
 @param result A @p RCCharacterObject, @p RCComicsObject, @p RCCreatorObject, @p RCEventObject, @p RCSeriesObject, or @p RCStoryObject object that contain the result provided by the response
 @param info A @p RCQueryInfoObject that contain the metadata about the response
 @param error A @p NSError object that contain the error data provided by the response
 */
typedef void (^resultCompletionBlock) (id result, RCQueryInfoObject *info, NSError *error);

/*!
 @typedef resultsCompletionBlock
 This block that is used as a callback and it is passed as a parameter to some of the methods of the @p RCMarvelAPI class. This particular block is used when it is required to return a list of results.
 @param results A list of @p RCCharacterObject, @p RCComicsObject, @p RCCreatorObject, @p RCEventObject, @p RCSeriesObject, or @p RCStoryObject objects that contain the results provided by the response
 @param info A @p RCQueryInfoObject that contain the metadata about the response
 @param error A @p NSError object that contain the error data provided by the response
 */
typedef void (^resultsCompletionBlock) (NSArray *results, RCQueryInfoObject *info, NSError *error);

/*!
 @class RCMarvelAPI
 This class is a manager class (implemented as a singleton) that interfaces with the Marvel Comics API. Throught this class, it is possible to make calls to the API by passing an identifier and/or a filter and a completion block that returns a response from the server.
 */
@interface RCMarvelAPI : NSObject

/*!
 @property publicKey
 This property sets and gets the public key provided by the Marvel Developer portal. This key is @b required to sign any request to the API.
 @see http://developer.marvel.com/account if you haven't created a developer account
 */
@property (nonatomic, strong) NSString *publicKey;

/*!
 @property privateKey
 This property sets and gets the private key provided by the Marvel Developer portal. This key is @b required to sign any request to the API.
 @see http://developer.marvel.com/account if you haven't created a developer account
 */
@property (nonatomic, strong) NSString *privateKey;

/*!
 @property version
 This property gets the current version of the API.
 @see http://developer.marvel.com/docs for more information about the API version
 */
@property (nonatomic, readonly, strong) NSString *version;

/*!
 This class method provide access to the only instance of the @p RCMarvelAPI object that should be allocated in memory.
 @return A @p RCMarvelAPI object
 */
+ (RCMarvelAPI *)api;

/*!
 This instance method interact with the @b /v1/public/characters/{characterId} API call and fetches a single @p RCCharacterObject object.

 @param identifier A @p NSNumber object that contain a unique character identifier
 @param completionBlock A @p resultCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)characterByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/characters API call and fetches a list of @p RCCharacterObject objects with optional filters.

 @param filter An @b optional @p RCCharacterFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)charactersByFilter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/comics/{comicId}/characters API call and fetches a list of @p RCCharacterObject objects which appear in a specific comic, with optional filters.

 @param identifier A @p NSNumber object that contain a unique comic identifier
 @param filter An @b optional @p RCCharacterFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)charactersByComicIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/events/{eventId}/characters API call and fetches a list of @p RCCharacterObject objects which appear in a specific event, with optional filters.

 @param identifier A @p NSNumber object that contain a unique event identifier
 @param filter An @b optional @p RCCharacterFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)charactersByEventIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/series/{seriesId}/characters API call and fetches a list of @p RCCharacterObject objects which appear in a specific series, with optional filters.

 @param identifier A @p NSNumber object that contain a unique series identifier
 @param filter An @b optional @p RCCharacterFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)charactersBySeriesIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/stories/{storyId}/characters API call and fetches a list of @p RCCharacterObject objects which appear in a single story, with optional filters.

 @param identifier A @p NSNumber object that contain a unique series identifier
 @param filter An @b optional @p RCCharacterFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)charactersByStoryIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/comics/{comicId} API call and fetches a single @p RCComicsObject object.

 @param identifier A @p NSNumber object that contain a unique comic identifier
 @param completionBlock A @p resultCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)comicByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/comics API call and fetches a list of @p RCComicsObject objects with optional filters.

 @param filter An @b optional @p RCComicsFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)comicsByFilter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/characters/{characterId}/comics API call and fetches a list of @p RCComicsObject objects containing a specific character, with optional filters.

 @param identifier A @p NSNumber object that contain a unique character identifier
 @param filter An @b optional @p RCComicsFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)comicsByCharacterIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/creators/{creatorId}/comics API call and fetches a list of @p RCComicsObject objects in which the works of a specific creator appears, with optional filters.

 @param identifier A @p NSNumber object that contain a unique creator identifier
 @param filter An @b optional @p RCComicsFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)comicsByCreatorIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/events/{eventId}/comics API call and fetches a list of @p RCComicsObject objects which takes place during a specific event, with optional filters.

 @param identifier A @p NSNumber object that contain a unique event identifier
 @param filter An @b optional @p RCComicsFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)comicsByEventIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/series/{seriesId}/comics API call and fetches a list of @p RCComicsObject objects which are published as part of a specific series, with optional filters.

 @param identifier A @p NSNumber object that contain a unique series identifier
 @param filter An @b optional @p RCComicsFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)comicsBySeriesIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/stories/{storyId}/comics API call and fetches a list of @p RCComicsObject objects in which a specific story appears, with optional filters.

 @param identifier A @p NSNumber object that contain a unique story identifier
 @param filter An @b optional @p RCComicsFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)comicsByStoryIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/creators/{creatorId} API call and fetches a single @p RCCreatorObject object.

 @param identifier A @p NSNumber object that contain a unique creator identifier
 @param completionBlock A @p resultCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)creatorByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/creators API call and fetches a list of @p RCCreatorObject objects with optional filters.

 @param filter An @b optional @p RCCreatorFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)creatorsByFilter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/comics/{comicId}/creators API call and fetches a list of @p RCCreatorObject objects whose works appears in a specific comic, with optional filters.

 @param identifier A @p NSNumber object that contain a unique comic identifier
 @param filter An @b optional @p RCCreatorFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)creatorsByComicIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/events/{eventId}/creators API call and fetches a list of @p RCCreatorObject objects whose works appears in a specific event, with optional filters.

 @param identifier A @p NSNumber object that contain a unique event identifier
 @param filter An @b optional @p RCCreatorFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)creatorsByEventIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/series/{seriesId}/creators API call and fetches a list of @p RCCreatorObject objects whose works appears in a specific series, with optional filters.

 @param identifier A @p NSNumber object that contain a unique series identifier
 @param filter An @b optional @p RCCreatorFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)creatorsBySeriesIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/stories/{storyId}/creators API call and fetches a list of @p RCCreatorObject objects whose works appears in a specific story, with optional filters.

 @param identifier A @p NSNumber object that contain a unique story identifier
 @param filter An @b optional @p RCCreatorFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)creatorsByStoryIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/events/{eventId} API call and fetches a single @p RCEventObject object.

 @param identifier A @p NSNumber object that contain a unique event identifier
 @param completionBlock A @p resultCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)eventByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/events API call and fetches a list of @p RCEventObject objects with optional filters.

 @param filter An @b optional @p RCEventFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)eventsByFilter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/characters/{characterId}/events API call and fetches a list of @p RCEventObject objects in which a specific character appears, with optional filters.

 @param identifier A @p NSNumber object that contain a unique character identifier
 @param filter An @b optional @p RCEventFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)eventsByCharacterIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/comics/{comicId}/events API call and fetches a list of @p RCEventObject objects in which a specific comic appears, with optional filters.

 @param identifier A @p NSNumber object that contain a unique comic identifier
 @param filter An @b optional @p RCEventFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)eventsByComicIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/creators/{creatorId}/events API call and fetches a list of @p RCEventObject objects featuring the work of a specific creator, with optional filters.

 @param identifier A @p NSNumber object that contain a unique creator identifier
 @param filter An @b optional @p RCEventFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)eventsByCreatorIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/series/{seriesId}/events API call and fetches a list of @p RCEventObject objects which occur in a specific series, with optional filters.

 @param identifier A @p NSNumber object that contain a unique series identifier
 @param filter An @b optional @p RCEventFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)eventsBySeriesIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/stories/{storyId}/events API call and fetches a list of @p RCEventObject objects in which a specific story appears, with optional filters.

 @param identifier A @p NSNumber object that contain a unique story identifier
 @param filter An @b optional @p RCEventFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)eventsByStoryIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/series/{eventId} API call and fetches a single @p RCSeriesObject object.

 @param identifier A @p NSNumber object that contain a unique series identifier
 @param completionBlock A @p resultCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)seriesByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/series API call and fetches a list of @p RCSeriesObject objects with optional filters.

 @param filter An @b optional @p RCSeriesFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)seriesByFilter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/characters/{characterId}/series API call and fetches a list of @p RCSeriesObject objects in which a specific character appears, with optional filters.

 @param identifier A @p NSNumber object that contain a unique character identifier
 @param filter An @b optional @p RCSeriesFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)seriesByCharacterIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/creators/{creatorId}/series API call and fetches a list of @p RCSeriesObject objects in which a specific creator's work appears, with optional filters.

 @param identifier A @p NSNumber object that contain a unique creator identifier
 @param filter An @b optional @p RCSeriesFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)seriesByCreatorIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/events/{eventId}/series API call and fetches a list of @p RCSeriesObject objects in which a specific event takes place, with optional filters.

 @param identifier A @p NSNumber object that contain a unique event identifier
 @param filter An @b optional @p RCSeriesFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)seriesByEventIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/stories/{storyId}/series API call and fetches a list of @p RCSeriesObject objects in which the specified story takes place, with optional filters.

 @param identifier A @p NSNumber object that contain a unique story identifier
 @param filter An @b optional @p RCSeriesFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)seriesByStoryIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/stories/{storyId} API call and fetches a single @p RCStoryObject object.

 @param identifier A @p NSNumber object that contain a unique story identifier
 @param completionBlock A @p resultCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)storyByIdentifier:(NSNumber *)identifier andCompletionBlock:(resultCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/stories API call and fetches a list of @p RCStoryObject objects with optional filters.

 @param filter An @b optional @p RCStoryFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)storiesByFilter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/characters/{characterId}/stories API call and fetches a list of @p RCStoryObject objects featuring a specific character, with optional filters.

 @param identifier A @p NSNumber object that contain a unique character identifier
 @param filter An @b optional @p RCStoryFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)storiesByCharacterIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/comics/{comicId}/stories API call and fetches a list of @p RCStoryObject objects in a specific comic issue, with optional filters.

 @param identifier A @p NSNumber object that contain a unique comic identifier
 @param filter An @b optional @p RCStoryFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)storiesByComicIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/creators/{creatorId}/stories API call and fetches a list of @p RCStoryObject objects by a specific creator, with optional filters.

 @param identifier A @p NSNumber object that contain a unique creator identifier
 @param filter An @b optional @p RCStoryFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)storiesByCreatorIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/events/{eventId}/stories API call and fetches a list of @p RCStoryObject objects from a specific event, with optional filters.

 @param identifier A @p NSNumber object that contain a unique event identifier
 @param filter An @b optional @p RCStoryFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)storiesByEventIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

/*!
 This instance method interact with the @b /v1/public/series/{seriesId}/stories API call and fetches a list of @p RCStoryObject objects from a specific series, with optional filters.

 @param identifier A @p NSNumber object that contain a unique series identifier
 @param filter An @b optional @p RCStoryFilter object that contain the parameters to search
 @param completionBlock A @p resultsCompletionBlock block as a callback
 @see http://developer.marvel.com/docs for more information about this API call
 */
- (void)storiesBySeriesIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCompletionBlock:(resultsCompletionBlock)completionBlock;

@end