//
//  RCAPIOperation.h
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

 RCAPIOperation class.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

#import "RCOperation.h"
#import "RCFilter.h"
#import "RCDataWrapperObject.h"
#import "RCAPITypes.h"

/*!
 @typedef

 This block that is used as a callback and it is assigned to the "callbackBlock" property on RCAPIOperation objects.

 @param data A data wrapper object that contain the data provided by the API response
 @param error A NSError object that contain the error data provided by the API response
 */
typedef void (^operationCallbackBlock) (RCDataWrapperObject *data, NSError *error);

/*!
 @class

 This class that extends the RCOperation base class and it handle both the request to an API endpoint and its respective response.
 */
@interface RCAPIOperation : RCOperation

/*!
 @property

 This property sets and gets the callback block which is called when the operation finishes.
 */
@property (nonatomic, copy) operationCallbackBlock callbackBlock;

/*!
 @property

 This property gets the identifier of a given resource.
 */
@property (nonatomic, readonly, strong) NSString *identifier;

/*!
 @property

 This property gets the URL object to an API endpoint.
 */
@property (nonatomic, readonly, strong) NSURL *url;

/*!
 @property

 This property gets the dictionary that contains the parameters sent to an API endpoint.
 */
@property (nonatomic, readonly, strong) NSDictionary *parameters;

/*!
 @property

 This property gets the filter with search parameters that are sent to an API endpoint.
 */
@property (nonatomic, readonly, strong) RCFilter *filter;

/*!
 @property

 This property gets the data wrapper object that contains the data returned from an API endpoint.
 */
@property (nonatomic, readonly, strong) RCDataWrapperObject *data;

/*!
 @property

 This property gets the operation type value assigned to the operation.
 */
@property (nonatomic, readonly) RCAPITypes type;

/*!
 @method
 
 This method initialise an operation with a given filter and authentication parameters.
 
 @param filter A filter that contain the parameters to search on an API endpoint
 @param authentication A dictionary that contains authentication parameters which sign a request to an API endpoint
 
 @return An intialised operation.
 */
- (id)initWithFilter:(RCFilter *)filter andAuthentication:(NSDictionary *)authentication;

/*!
 @method

 This method initialise an operation with a given type, an identifier for a resource and authentication parameters.

 @param type An integer value that define the type of operation to initialise
 @param identifier The identifier to a particular resource to retrieve from an API endpoint
 @param authentication A dictionary that contains authentication parameters which sign a request to an API endpoint

 @return An intialised operation.
 */
- (id)initWithType:(RCAPITypes)type identifier:(NSString *)identifier andAuthentication:(NSDictionary *)authentication;

/*!
 @method

 This method initialise an operation with a given type, an identifier for a resource, a filter and authentication parameters.
 
 In case the type of the given filter differ from the type assigned to the operation, the former type defines the operation type before executing the request to an API endpoint.

 @param type An integer value that define the type of operation to initialise
 @param identifier The identifier to a particular resource to retrieve from an API endpoint
 @param filter A filter that contain the parameters to search on an API endpoint
 @param authentication A dictionary that contains authentication parameters which sign a request to an API endpoint

 @return An intialised operation.
 */
- (id)initWithType:(RCAPITypes)type identifier:(NSString *)identifier filter:(RCFilter *)filter andAuthentication:(NSDictionary *)authentication;

@end
