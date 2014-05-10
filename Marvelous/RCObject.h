//
//  RCObject.h
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

 RCObject base class.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

#import "RCObjectProtocol.h"

/*!
 @class

 This base class defines every common properties and methods every object could be able to access.
 */
@interface RCObject : NSObject <RCObjectProtocol>

/*!
 @method

 This method convert a given string with "yyyy-MM-dd'T'HH:mm:ssZ" or "yyyy-MM-dd HH:mm:ss" formats to a date.

 @param string A string that represent a date

 @return A date that represent the given string
 */

- (NSDate *)dateFromString:(NSString *)string;

/*!
 @method

 This method obtain a list of URL objects from a given list of JSON dictionaries returned by an API endpoint.

 @param array A list of given JSON dictionaries

 @return A list of RCURLObject objects obtained from the dictionaries
 */
- (NSArray *)urlsFromArray:(NSArray *)array;

/*!
 @method

 This method checks the validity of a given object.

 @param object An object to validate

 @return A boolean value that represent whether the object is indeed valid
 */
- (BOOL)isValidObject:(id)object;

@end
