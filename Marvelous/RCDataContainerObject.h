//
//  RCDataContainerObject.h
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

 RCDataContainerObject class.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import "RCObject.h"
#import "RCAPITypes.h"

/*!
 @class

 This class is a object representation of a DataContainer resource.
 */
@interface RCDataContainerObject : RCObject

/*!
 @property

 This property gets the number of skipped results of an API call.
 */
@property (nonatomic, readonly, strong) NSNumber *offset;

/*!
 @property

 This property gets the number of result limit.
 */
@property (nonatomic, readonly, strong) NSNumber *limit;

/*!
 @property

 This property gets the total number of resources available given the current filter set.
 */
@property (nonatomic, readonly, strong) NSNumber *total;

/*!
 @property

 This property gets the number of results returned by an API call.
 */
@property (nonatomic, readonly, strong) NSNumber *count;

/*!
 @property

 This property gets the list of resources returned by an API call.
 */
@property (nonatomic, readonly, strong) NSArray *results;

/*!
 @method

 This method initialise a data container object with a type and a given JSON dictionary returned by an API endpoint.

 @param type The type of resource to initialise with a JSON dictionary
 @param dictionary A JSON dictionary retrieved from an API endpoint

 @return An initialised object
 */
- (id)initWithType:(RCAPITypes)type andDictionary:(NSDictionary *)dictionary;

@end
