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

/*!
 @header

 RCMarvelAPI interface.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

#import "RCBlocks.h"
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
 @class

 This class is a manager class (implemented as a singleton) that interfaces with the Marvel Comics API. Throught this class, it is possible to make calls to the API by passing an identifier and/or a filter and a callback block that returns a response from the API server.
 */
@interface RCMarvelAPI : NSObject

/*!
 @property

 This property sets and gets the public key provided by the Marvel Developer portal. This key is required to sign any request to the API.
 
 In case you don't have a Marvel developer account, you should create one at http://developer.marvel.com/account
 */
@property (nonatomic, strong) NSString *publicKey;

/*!
 @property

 This property sets and gets the private key provided by the Marvel Developer portal. This key is required to sign any request to the API.
 
 In case you don't have a Marvel developer account, you should create one at http://developer.marvel.com/account
 */
@property (nonatomic, strong) NSString *privateKey;

/*!
 @property

 This property gets the current version name of the API.
 
 For more information about the API version, please refer to http://developer.marvel.com/docs
 */
@property (nonatomic, readonly, strong) NSString *version;

/*!
 @method

 This class method provide access to the only instance of the RCMarvelAPI object that should be allocated in memory.
 
 @return A common RCMarvelAPI instance
 */
+ (instancetype)api;

/*!
 @method

 This instance method interact with the /v1/public/characters/{characterId} API endpoint and fetches a single RCCharacterObject object.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique character identifier
 @param callbackBlock A callback block
 */
- (void)characterByIdentifier:(NSNumber *)identifier andCallbackBlock:(resultCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/characters API endpoint and fetches a list of RCCharacterObject objects, with optional filters.
 
 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)charactersByFilter:(RCCharacterFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method 

 This instance method interact with the /v1/public/comics/{comicId}/characters API endpoint and fetches a list of RCCharacterObject objects which appear in a specific comic, with optional filters.
 
 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique comic identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)charactersByComicIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/events/{eventId}/characters API endpoint and fetches a list of RCCharacterObject objects which appear in a specific event, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique event identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)charactersByEventIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method 

 This instance method interact with the /v1/public/series/{seriesId}/characters API endpoint and fetches a list of RCCharacterObject objects which appear in a specific series, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique series identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)charactersBySeriesIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method 

 This instance method interact with the /v1/public/stories/{storyId}/characters API endpoint and fetches a list of RCCharacterObject objects which appear in a single story, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique series identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)charactersByStoryIdentifier:(NSNumber *)identifier filter:(RCCharacterFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/comics/{comicId} API endpoint and fetches a single RCComicsObject object.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique comic identifier
 @param callbackBlock A callback block
 */
- (void)comicByIdentifier:(NSNumber *)identifier andCallbackBlock:(resultCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/comics API endpoint and fetches a list of RCComicsObject objects, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)comicsByFilter:(RCComicsFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/characters/{characterId}/comics API endpoint and fetches a list of RCComicsObject objects containing a specific character, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique character identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)comicsByCharacterIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/creators/{creatorId}/comics API endpoint and fetches a list of RCComicsObject objects in which the works of a specific creator appears, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique creator identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)comicsByCreatorIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/events/{eventId}/comics API endpoint and fetches a list of RCComicsObject objects which takes place during a specific event, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique event identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)comicsByEventIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/series/{seriesId}/comics API endpoint and fetches a list of RCComicsObject objects which are published as part of a specific series, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique series identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)comicsBySeriesIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/stories/{storyId}/comics API endpoint and fetches a list of RCComicsObject objects in which a specific story appears, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique story identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)comicsByStoryIdentifier:(NSNumber *)identifier filter:(RCComicsFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/creators/{creatorId} API endpoint and fetches a single RCCreatorObject object.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique creator identifier
 @param callbackBlock A callback block
 */
- (void)creatorByIdentifier:(NSNumber *)identifier andCallbackBlock:(resultCallbackBlock)callbackBlock;

/*!
 This instance method interact with the /v1/public/creators API endpoint and fetches a list of RCCreatorObject objects with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)creatorsByFilter:(RCCreatorFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 This instance method interact with the /v1/public/comics/{comicId}/creators API endpoint and fetches a list of RCCreatorObject objects whose works appears in a specific comic, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique comic identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)creatorsByComicIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 This instance method interact with the /v1/public/events/{eventId}/creators API endpoint and fetches a list of RCCreatorObject objects whose works appears in a specific event, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique event identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)creatorsByEventIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 This instance method interact with the /v1/public/series/{seriesId}/creators API endpoint and fetches a list of RCCreatorObject objects whose works appears in a specific series, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique series identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)creatorsBySeriesIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 This instance method interact with the /v1/public/stories/{storyId}/creators API endpoint and fetches a list of RCCreatorObject objects whose works appears in a specific story, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique story identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)creatorsByStoryIdentifier:(NSNumber *)identifier filter:(RCCreatorFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/events/{eventId} API endpoint and fetches a single RCEventObject object.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique event identifier
 @param callbackBlock A callback block
 */
- (void)eventByIdentifier:(NSNumber *)identifier andCallbackBlock:(resultCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/events API endpoint and fetches a list of RCEventObject objects with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)eventsByFilter:(RCEventFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/characters/{characterId}/events API endpoint and fetches a list of RCEventObject objects in which a specific character appears, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique character identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)eventsByCharacterIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/comics/{comicId}/events API endpoint and fetches a list of RCEventObject objects in which a specific comic appears, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique comic identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)eventsByComicIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/creators/{creatorId}/events API endpoint and fetches a list of RCEventObject objects featuring the work of a specific creator, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique creator identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)eventsByCreatorIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/series/{seriesId}/events API endpoint and fetches a list of RCEventObject objects which occur in a specific series, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique series identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)eventsBySeriesIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/stories/{storyId}/events API endpoint and fetches a list of RCEventObject objects in which a specific story appears, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique story identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)eventsByStoryIdentifier:(NSNumber *)identifier filter:(RCEventFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/series/{eventId} API endpoint and fetches a single RCSeriesObject object.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique series identifier
 @param callbackBlock A callback block
 */
- (void)seriesByIdentifier:(NSNumber *)identifier andCallbackBlock:(resultCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/series API endpoint and fetches a list of RCSeriesObject objects with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)seriesByFilter:(RCSeriesFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/characters/{characterId}/series API endpoint and fetches a list of RCSeriesObject objects in which a specific character appears, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique character identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)seriesByCharacterIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/creators/{creatorId}/series API endpoint and fetches a list of RCSeriesObject objects in which a specific creator's work appears, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique creator identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)seriesByCreatorIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/events/{eventId}/series API endpoint and fetches a list of RCSeriesObject objects in which a specific event takes place, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique event identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)seriesByEventIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/stories/{storyId}/series API endpoint and fetches a list of RCSeriesObject objects in which the specified story takes place, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique story identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)seriesByStoryIdentifier:(NSNumber *)identifier filter:(RCSeriesFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/stories/{storyId} API endpoint and fetches a single RCStoryObject object.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique story identifier
 @param callbackBlock A callback block
 */
- (void)storyByIdentifier:(NSNumber *)identifier andCallbackBlock:(resultCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/stories API endpoint and fetches a list of RCStoryObject objects with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)storiesByFilter:(RCStoryFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/characters/{characterId}/stories API endpoint and fetches a list of RCStoryObject objects featuring a specific character, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique character identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)storiesByCharacterIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/comics/{comicId}/stories API endpoint and fetches a list of RCStoryObject objects in a specific comic issue, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique comic identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)storiesByComicIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/creators/{creatorId}/stories API endpoint and fetches a list of RCStoryObject objects by a specific creator, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique creator identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)storiesByCreatorIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/events/{eventId}/stories API endpoint and fetches a list of RCStoryObject objects from a specific event, with optional filters.

 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique event identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)storiesByEventIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

/*!
 @method

 This instance method interact with the /v1/public/series/{seriesId}/stories API endpoint and fetches a list of RCStoryObject objects from a specific series, with optional filters.
 
 For more information about this API endpoint, please refer to http://developer.marvel.com/docs

 @param identifier A unique series identifier
 @param filter An optional filter that contain the parameters to search
 @param callbackBlock A callback block
 */
- (void)storiesBySeriesIdentifier:(NSNumber *)identifier filter:(RCStoryFilter *)filter andCallbackBlock:(resultsCallbackBlock)callbackBlock;

@end