//
//  RCFilter.h
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

 RCFilter base class.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

#import "RCOrderByTypeCodes.h"
#import "RCAPITypes.h"

/*!
 @class

 This base class defines every common properties and methods every filter could be able to access.
 */
@interface RCFilter : NSObject

/*!
 @property
 
 This property sets and gets the date the filter use to search for resources which have been modified since that specific date.
 */
@property (nonatomic, strong) NSDate *modifiedSince;

/*!
 @property

 This property sets and gets the specific number of resources the result set is limited to retrieve.
 */
@property (nonatomic, strong) NSNumber *limit;

/*!
 @property

 This property sets and gets the specific number of resources the result set should skip.
 */
@property (nonatomic, strong) NSNumber *offset;

/*!
 @property

 This property sets and gets the list of order by codes which order the result set. 
 
 The list accepts only RCOrderByTypeCodes values represented as NSNumber objects and multiple values are given priority in the order in which they are passed.
 */
@property (nonatomic, strong) NSArray *orderBy;

/*!
 @property

 This property gets a dictionary containing the defined properties. 
 
 The keys are the parameter keys to be used during the API request while the values are converted to string. In case a date is assigned to the "modifiedSince" property, it converted to string with a "yyyy-MM-dd'T'HH:mm:ssZ" format. In case a list is assigned to the "orderBy" property, only the types included on the "validOrderTypes" list are converted to string, while the others are ignored.
 */
@property (nonatomic, readonly, strong) NSDictionary *parameters;

/*!
 @property

 This property gets a list containing the order by types allowed by the filter. 
 
 The list contains NSNumber objects that represent RCOrderByTypeCodes values.
 */
@property (nonatomic, readonly, strong) NSArray *validOrderTypes;

/*!
 @property

 This property gets the filter type value defined by the class the object belongs to.
 */
@property (nonatomic, readonly) RCAPITypes type;

@end
