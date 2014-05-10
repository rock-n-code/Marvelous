//
//  RCBlocks.h
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

 RCBlocks definitions.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

@class RCQueryInfoObject;

/*!
 @typedef

 This block that is used as a callback and it is passed as a parameter to some of the methods of the RCMarvelAPI class. This particular block is used when it is required to return only one result from the API.

 @param result A RCCharacterObject, RCComicsObject, RCCreatorObject, RCEventObject, RCSeriesObject, or RCStoryObject object that contain the result provided by the response
 @param info A RCQueryInfoObject object that contain the metadata about the response
 @param error A NSError object that contain the error data provided by the response
 */
typedef void (^resultCallbackBlock) (id result, RCQueryInfoObject *info, NSError *error);

/*!
 @typedef

 This block that is used as a callback and it is passed as a parameter to some of the methods of the RCMarvelAPI class. This particular block is used when it is required to return a list of results.

 @param results A list of RCCharacterObject, RCComicsObject, RCCreatorObject, RCEventObject, RCSeriesObject, or RCStoryObject objects that contain the results provided by the response
 @param info A RCQueryInfoObject object that contain the metadata about the response
 @param error A NSError object that contain the error data provided by the response
 */
typedef void (^resultsCallbackBlock) (NSArray *results, RCQueryInfoObject *info, NSError *error);